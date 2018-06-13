from datetime import datetime

from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from django.shortcuts import redirect
from django.http import HttpResponseRedirect
from rest_framework.response import Response
from rest_framework.views import APIView

from utils.permissions import IsOwnerOrReadOnly
from .serializer import ShoppingCartSerializer, ShoppingCartDetailSerializer, OrderSerializer, OrderDetailSerializer
from .models import ShoppingCart, OrderInfo, OrderGoods
from utils.alipay import AliPay
from eshop.settings import ali_pub_key_path, private_key_path

# Create your views here.

class ShoppingCartViewset(viewsets.ModelViewSet):
    """
    购物车功能
    list:
        获取购物车详情
    create:
        加入购物车
    delete:
        删除购物记录
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    lookup_field = "goods_id"

    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == "list":
            return ShoppingCartDetailSerializer
        return ShoppingCartSerializer

    def perform_create(self, serializer):
        """
        库存数减去购物车
        :param serializer:
        :return:
        """
        shop_cart = serializer.save()
        goods = shop_cart.goods
        goods.goods_num -= shop_cart.nums
        goods.save()

    def perform_destroy(self, instance):
        goods = instance.goods
        goods.goods_num += instance.nums
        goods.save()
        instance.delete()

    def perform_update(self, serializer):
        existed_record = ShoppingCart.objects.get(id=serializer.instance.id)  # 取出购物车的记录
        existed_nums = existed_record.nums  # 取出购物车的数量
        save_record = serializer.save()  # 获取修改后的数量
        nums = save_record.nums - existed_nums # 修改后的数量 - 购物车的数量
        goods = save_record.goods  # 获取修改后数量的库存数
        goods.goods_num -= nums    # 修改后的数量比购物车的数量大,库存就减差值; 修改后的数量比购物车的数量小,即负数,库存就加这个差值.
        goods.save()                # 库存保存

class OrderViewset(viewsets.GenericViewSet, mixins.ListModelMixin,
                   mixins.CreateModelMixin, mixins.DestroyModelMixin,
                   mixins.RetrieveModelMixin):
    """
    订单管理
    list:
        获取个人订单
    delete:
        删除订单
    create:
        新增订单
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = OrderSerializer

    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == "retrieve":
            return OrderDetailSerializer
        return OrderSerializer

    def perform_create(self, serializer):
        order = serializer.save()
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        for shop_carts in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_carts.goods
            order_goods.goods_nums = shop_carts.nums
            order_goods.order = order
            order_goods.save()

            shop_carts.delete()
        return order


class AliayView(APIView):
    def get(self, request):
        """
        处理支付宝的return_url返回
        :return:
        """
        processed_dict = {}
        for key, value in request.GET.items():
            processed_dict[key] = value

        sign = processed_dict.pop("sign", None)

        alipay = AliPay(
            appid="",
            app_notify_url="",
            app_private_key_path=private_key_path,
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url=""
        )

        verify_re = alipay.verify(processed_dict, sign)

        if verify_re is True:
            order_sn = processed_dict.get('out_trade_no', None)
            trade_no = processed_dict.get('trade_no', None)
            trade_status = processed_dict.get('trade_status', 'paying')

            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:
                existed_order.pay_status = trade_status
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()

            response = redirect("")
            response.set_cookie("nextPath", "pay", max_age=2)
            return response
        else:
            response = redirect("")
            return response

    def post(self,request):
        """
        处理支付宝的notify_url
        :return:
        """
        processed_dict = {}
        for key, value in request.POST.items():
            processed_dict[key] = value

        sign = processed_dict.pop("sign", None)

        alipay = AliPay(
            appid="",
            app_notify_url="",
            app_private_key_path= private_key_path,
            alipay_public_key_path= ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url=""
        )

        verify_re = alipay.verify(processed_dict, sign)

        if verify_re is True:
            order_sn = processed_dict.get('out_trade_no', None)
            trade_no = processed_dict.get('trade_no', None)
            trade_status = processed_dict.get('trade_status', 'paying')
            print(trade_status)
            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:

                # 下订单后,修改售卖数量
                order_goods = existed_order.goods.all()   #获取订单里面所有的物品
                for order_good in order_goods:
                    goods = order_good.goods
                    goods.sold_num += order_goods.goods_num  # 物品的售卖数 + 订单的物品数
                    goods.save()

                existed_order.pay_status = trade_status
                print(existed_order.pay_status)
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()

            return Response("success")

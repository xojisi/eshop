from datetime import datetime

from django.db import models
from django.contrib.auth import get_user_model
User = get_user_model()

from goods.models import Goods

# Create your models here.

class ShoppingCart(models.Model):
    """
    购物车
    """
    user = models.ForeignKey(User, verbose_name="用户")
    goods = models.ForeignKey(Goods, verbose_name="商品", help_text="商品")
    nums = models.IntegerField(verbose_name="购买数量", default=0, help_text="数量")
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "购物车"
        verbose_name_plural = verbose_name
        unique_together = ("user", "goods")

    def __str__(self):
        return "%s(%d)".format(self.goods.name, self.nums)


class OrderInfo(models.Model):
    """
    订单
    """
    ORDER_STATUS = (
        ("TRADE_SUCCESS", "成功"),
        ("TRADE_CLOSED", "超时关闭"),
        ("WAIT_BUYER_PAY", "交易创建"),
        ("TRADE_FINISHED", "交易结束"),
        ("paying", "待支付"),
    )
    user = models.ForeignKey(User, verbose_name="用户")
    order_sn = models.CharField(verbose_name="订单号", null=True, blank=True, max_length=30, unique=True)
    trade_no = models.CharField(verbose_name="交易号", max_length=100, unique=True, null=True, blank=True)
    pay_status = models.CharField(verbose_name="订单状态", max_length=20, choices=ORDER_STATUS, default="paying")
    post_script = models.CharField(verbose_name="订单留言", max_length=200)
    order_mount = models.FloatField(default=0.0, verbose_name="订单金额")
    pay_time = models.DateTimeField(verbose_name="支付时间", null=True, blank=True)

    # 用户信息
    address = models.CharField(verbose_name="收货地址",max_length=100, default="")
    signer_name = models.CharField(verbose_name="签收人", max_length=20, default="")
    signer_mobile = models.CharField(verbose_name="联系电话", max_length=11)

    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "订单"
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order_sn)


class OrderGoods(models.Model):
    """
    订单的商品详情
    """
    order = models.ForeignKey(OrderInfo, verbose_name="订单信息", related_name="goods")
    goods = models.ForeignKey(Goods, verbose_name="商品")
    goods_nums = models.IntegerField(verbose_name="商品数量", default=0)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "订单商品"
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order.order_sn)

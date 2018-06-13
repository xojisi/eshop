"""eshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
# from django.contrib import admin
import xadmin
from django.views.static import serve
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token

from goods.views import GoodsListViewSet, CategoryViewSet, BannerViewset, HotSearchsViewset
from goods.views import IndexCategoryViewset
from eshop.settings import MEDIA_ROOT
from users.views import SmsCodeViewSet, UserViewSet, IndexView
from user_operation.views import UserFavViewset, LeavingMessageViewset, AddressViewset
from trade.views import ShoppingCartViewset, OrderViewset, AliayView
from django.views.generic import TemplateView
# from utils.image_upload import UploadImage

router = DefaultRouter()
router.register(r'goods', GoodsListViewSet, base_name="goods")  # 配置goods的url
router.register(r'code', SmsCodeViewSet, base_name="code")  #
router.register(r'categorys', CategoryViewSet, base_name="categorys")  # 配置category的url
router.register(r'users', UserViewSet, base_name="users") # 用户操作
router.register(r'userfavs', UserFavViewset, base_name="userfavs")  # 收藏
router.register(r'messages', LeavingMessageViewset, base_name="messages")  # 留言
router.register(r'address', AddressViewset, base_name="address")  # 收货地址
router.register(r'shopcarts', ShoppingCartViewset, base_name="shopcarts")  # 购物车
router.register(r'orders', OrderViewset, base_name="orders")  # 订单相关
router.register(r'banners', BannerViewset, base_name="banners")  # 轮播图
router.register(r'hotsearchs', HotSearchsViewset, base_name="hotsearchs") # 热搜
router.register(r'indexgoods', IndexCategoryViewset, base_name="indexgoods") # 热搜

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    # url(r'^admin/', admin.site.urls),

    url(r'^', include(router.urls)),
    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    url(r'docs/', include_docs_urls(title="生鲜平台")),
    url(r'^api-auth/', include('rest_framework.urls')),

    # drf自带的token认证模式
    url(r'^api-token-auth/', views.obtain_auth_token),

    # jwt的认证接口
    url(r'^login/$', obtain_jwt_token),

    # 富文本相关URL
    url(r'^ueditor/', include('DjangoUeditor.urls')),

    url(r'^alipay/return/', AliayView.as_view(), name="alipay"),

    # url(r'index/',TemplateView.as_view(template_name="index.html"), name="index"),
    url(r'index/', IndexView.as_view(), name="index"),

    # 第三方登录
    url('', include('social_django.urls', namespace='social'))

    # 七牛云上传测试
    # url(r'^upload/$', view=UploadImage.as_view(), name='upload'),
    # url(r'^uploadprocessor/$', view=GetImageUrl.as_view(), name='uploadprocessor'),

    # 商品列表页 非DRF方法
    # url(r'goods/$', goods_list, name="good-list"),
]

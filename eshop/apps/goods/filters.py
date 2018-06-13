# -*- coding:utf-8 -*-
__author__ = 'xojisi'

import django_filters
from django.db.models import Q

from .models import Goods



class GoodsFilter(django_filters.rest_framework.FilterSet):
    """
    商品的过滤类
    """
    pricemin = django_filters.NumberFilter(name="shop_price", lookup_expr='gte', help_text="最低价格")
    pricemax = django_filters.NumberFilter(name="shop_price", lookup_expr='lte', help_text="最高价格")
    # name = django_filters.CharFilter(name="name", lookup_expr="icontains")

    top_category = django_filters.NumberFilter(method='top_category_filter')

    def top_category_filter(self,queryset, name, value):
        """
        理解帮助:前端传一个生鲜食品(id=1)(一级类目)过来,
                这里要返回商品类型为一级类目及其所包含的二,三级类目.
                即: Goods.category = 1 [一级类目]
                    Goods.category 的 parent_category = 1  [二级类目, 父类为一级类目]
                    或 Goods.category 的 parent_category 的 parent_category = 1 [三级类目,父类为一级类目下的二级类目]
        :param queryset:
        :param name:
        :param value:
        :return:
        """
        return queryset.filter(
            Q(category_id=value)|
            Q(category__parent_category_id=value)|
            Q(category__parent_category_id__parent_category_id=value)
        )

    class Meta:
        model = Goods
        fields = ['pricemin', 'pricemax','is_hot','is_new']
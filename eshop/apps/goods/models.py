from datetime import datetime

from django.db import models
from DjangoUeditor.models import UEditorField

# Create your models here.

class GoodsCategory(models.Model):
    """
    商品类别
    """
    CATEGORY_TYPE = (
        (1, "一级类目"),
        (2, "二级类目"),
        (3, "三级类目"),
    )

    name = models.CharField(verbose_name="类别名", default="", max_length=30, help_text="类别名")
    code = models.CharField(verbose_name="类别code", default="", max_length=30, help_text="类别code")
    desc = models.CharField(verbose_name="类别描述", default="", help_text="类别描述", max_length=100)
    category_type = models.IntegerField(verbose_name="类目级别", help_text="类目级别", choices=CATEGORY_TYPE)
    parent_category = models.ForeignKey("self", verbose_name="父类别", related_name="sub_cat", null=True , blank=True)
    is_tab = models.BooleanField(verbose_name="是否导航", help_text="是否导航", default=False)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "商品类别"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class GoodsCategoryBrand(models.Model):
    """
    品牌名
    """
    category = models.ForeignKey(GoodsCategory, related_name="brands", verbose_name="商品类目", null=True, blank=True)
    name = models.CharField(verbose_name="品牌名", help_text="品牌名", default="", max_length=30)
    desc = models.CharField(verbose_name="品牌描述", help_text="品牌描述", default="", max_length=200)
    image = models.ImageField(upload_to="brands/",max_length=200)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "品牌"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Goods(models.Model):
    """
    商品
    """
    category = models.ForeignKey(GoodsCategory, verbose_name="商品类目")
    goods_sn = models.CharField(verbose_name="商品唯一货号", max_length=50, default="")
    name = models.CharField(verbose_name="商品名", max_length=300)
    click_num = models.IntegerField(verbose_name="点击数", default=0)
    sold_num = models.IntegerField(verbose_name="商品销售量", default=0)
    fav_num = models.IntegerField(verbose_name="收藏数", default=0)
    goods_num = models.IntegerField(verbose_name="库存数", default=0)
    market_price = models.FloatField(verbose_name="市场价格", default=0)
    shop_price = models.FloatField(verbose_name="本店价格", default=0)
    goods_brief = models.TextField(verbose_name="商品简短描述", default=500)
    goods_desc = UEditorField(verbose_name=u"内容", imagePath="goods/images/", width=1000, height=300,
                              filePath="goods/files/", default="")
    ship_free = models.BooleanField(verbose_name="是否承担运费", default=True)
    goods_front_image = models.ImageField(verbose_name="封面图", upload_to="goods/images/", null=True, blank=True)
    is_new = models.BooleanField(verbose_name="是否新品", default=False)
    is_hot = models.BooleanField(verbose_name="是否热销", default=False)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = '商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class GoodsImage(models.Model):
    """
    商品轮播图
    """
    goods = models.ForeignKey(Goods, verbose_name="商品", related_name="images")
    image = models.ImageField(verbose_name="图片", upload_to="", null=True, blank=True)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)


    class Meta:
        verbose_name = "商品轮播图"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class Banner(models.Model):
    """
    轮播的商品
    """
    goods = models.ForeignKey(Goods, verbose_name="商品")
    image = models.ImageField(verbose_name="轮播图片", upload_to="banner")
    index = models.IntegerField(verbose_name="轮播顺序", default=0)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "轮播商品"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class IndexAd(models.Model):
    category = models.ForeignKey(GoodsCategory, related_name='category',verbose_name="商品类目")
    goods = models.ForeignKey(Goods, related_name='goods')

    class Meta:
        verbose_name = '首页商品类别广告'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class HotSearchWords(models.Model):
    """
    热搜词
    """
    keywords = models.CharField(default="", max_length=20, verbose_name="热搜词")
    index = models.IntegerField(default=0, verbose_name="排序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '热搜词'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.keywords

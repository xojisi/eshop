from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class UserProfile(AbstractUser):
    '''
    用户
    '''
    name = models.CharField(verbose_name='姓名', max_length=30, null=True ,blank=True, help_text="姓名")
    birthday = models.DateField(verbose_name='出生年月', null=True, blank=True, help_text="出生日期")
    gender = models.CharField(verbose_name='性别', max_length=6, choices=(('male',u'男'),('female','女')), default="male", help_text="性别(male/female)")
    mobile = models.CharField(verbose_name='电话', null=True, blank=True, max_length=11, help_text="手机号")
    email = models.CharField(verbose_name='邮箱', max_length=100, null=True, blank=True)

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class VerifyCode(models.Model):
    """
    短信验证码
    """
    code = models.CharField(max_length=10, verbose_name="验证码", help_text="验证码")
    mobile = models.CharField(verbose_name='电话', max_length=11)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "短信验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code
# -*- coding:utf-8 -*-
__author__ = 'xojisi'

import re
from datetime import datetime, timedelta

from rest_framework import serializers
from django.contrib.auth import get_user_model
User = get_user_model()
from rest_framework.validators import UniqueValidator

from .models import VerifyCode


class SmSerializer(serializers.Serializer):
    """
    如果用ModelSerializer会报错,因为code是必填字段,但最开始先发送的仅为手机号.
    """
    mobile = serializers.CharField(max_length=11)

    def validate_mobile(self, mobile):
        """
        验证手机号码
        :param mobile:
        :return:
        """
        REGEX_MOBILE = "0?(13|14|15|17|18|19)[0-9]{9}"

        # 手机是否注册
        if User.objects.filter(mobile=mobile).count():
            raise serializers.ValidationError("用户已经存在")

        # 验收手机号码是否合法
        if not re.match(REGEX_MOBILE, mobile):
            a = serializers.ValidationError("手机号码非法")
            raise serializers.ValidationError("手机号码非法")

        # 验证码发送频率
        one_min_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_min_ago, mobile=mobile).count():
            raise serializers.ValidationError("距离上一次发送未超过60s")

        return mobile

class UserDetailSerializer(serializers.ModelSerializer):
    """
    用户详情序列化
    """
    class Meta:
        model = User
        fields = ("name", "gender", "birthday", 'email',"mobile")

class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(
        required=True, write_only=True, max_length=6, min_length=6, label='验证码',
        error_messages= {
            "blank": "请输入验证码",
            "required": "请输入验证码",
            "max_length": "验证码格式错误",
            "min_length": "验证码格式错误",
        },
        help_text="验证码"
    )
    username = serializers.CharField(
        required=True, allow_blank=False, label="用户名/手机",
        validators=[UniqueValidator(queryset=User.objects.all(), message="用户已经存在")],
        help_text="用户名"
    )
    password = serializers.CharField(
        style={'input_type': 'password'}, label="密码", write_only=True, help_text="密码"
    )

    # validate_<iterm>,  iterm 为需要自定验证的字段
    def validate_code(self, code):
        verify_records = VerifyCode.objects.filter(mobile=self.initial_data["username"]).order_by("-add_time")

        if verify_records:
            last_record = verify_records[0]

            if last_record.code != code:
                raise serializers.ValidationError("验证码错误")

            five_min_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
            if five_min_ago > last_record.add_time:
                raise serializers.ValidationError("验证码过期")

        else:
            raise serializers.ValidationError("验证码错误")

    # def validate_password(self, password):
    #     if len(password) < 6:
    #         raise serializers.ValidationError("密码过短")


    def validate(self, attrs):
        attrs['mobile'] = attrs['username']
        del attrs["code"]
        return attrs

    class Meta:
        model = User
        fields = ("username", "code", "mobile", 'password')


    # # 可用signals.py取代,相关知识点:信号量
    # def create(self, validated_data):
    #     # class Meta里已经知名 model = User, 所以这里可以取出User表
    #     # set_password在 AbstractBaseUser类里
    #     user = super(UserRegSerializer, self).create(validated_data=validated_data)
    #     user.set_password(validated_data['password'])
    #     user.save()
    #     return user

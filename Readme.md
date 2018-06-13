生鲜商店

Vue + Django REST framework + Xadmin 

项目介绍

生鲜电商，功能：商品展示，购物车（下单、结算），收藏等购物的相关功能，本项目采用手机号动态验证码注册，支付宝支付，第三方登录等功能，为大家提供了一个较为完整的电商系统。


项目环境

后端

1. Django REST framework 

2. Xadmin

前端

1. 安装node.js

2. 安装cnpm

3. 安装vue-cli

4. 安装依赖库

5. build 然后把 静态文件放到static，跟templates里。

启动步骤：

1. 安装python依赖包

2. 配置settings.py的数据库连接

3. 新建数据库eshop

4. 用manage.py同步

5. 导入数据库 sql

6. build前端（假设已按上述“前端说明”处理完），将静态文件移动到static以及templates

7. runserver




备注：
1. 敏感信息已删除，如需要请自行配置。

2. 新账号注册说明：这里用的是手机号来注册，云片网的接口app/user里，并需要在settings.py配置appkey。或是用管理员登录

3. 微博登录有Bug,不建议使用

4. 支付宝接口在沙箱测试ok,不过需要自己在settings.py配置，以及AliayView(app/trade)里的appid、回调等


 
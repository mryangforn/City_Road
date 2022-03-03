
from django.urls import path
from django.views.generic import RedirectView
from .views import *

urlpatterns = [
    # 首页地址自动跳转用户登录页面
    path('', RedirectView.as_view(url='user/login.html')),
    # 文章列表
    path('<int:id>/<int:page>.html', article, name='article'),
    # 文章正文内容
    path('detail/<int:id>/<int:aId>.html', detail, name='detail')
]

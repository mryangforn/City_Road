

from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('user/', include('account.urls')),
    path('', include('article.urls')),
    path('album/', include('album.urls')),
    path('board/', include('interflow.urls')),
    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),
    re_path('static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}, name='static'),
    # 设置编辑器的路由信息
    path('ckeditor/', include('ckeditor_uploader.urls')),
]


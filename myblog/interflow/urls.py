
from django.urls import path
from .views import *
urlpatterns = [
    # 留言板
    path('<int:id>/<int:page>.html', board, name='board'),
]

from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from django.core.paginator import PageNotAnInteger
from django.core.paginator import EmptyPage
from article.models import ArticleTag
from account.models import MyUser
from album.models import AlbumInfo
from .models import Board
from django.urls import reverse


def board(request, id, page):
    album = AlbumInfo.objects.filter(user_id=id)
    tag = ArticleTag.objects.filter(user_id=id)
    user = MyUser.objects.filter(id=id).first()
    if not user:
        return redirect(reverse('register'))
    if request.method == 'GET':
        boardList = Board.objects.filter(user_id=id).order_by('-created')
        paginator = Paginator(boardList, 10)
        try:
            pageInfo = paginator.page(page)
        except PageNotAnInteger:
            # 如果参数page 的数据类型不是整型，就返回第一页数据
            pageInfo = paginator.page(1)
        except EmptyPage:
            # 若用户访问的页数大于实际页数，则返回最后一页的数据
            pageInfo = paginator.page(paginator.num_pages)
        return render(request, 'board.html', locals())
    else:
        name = request.POST.get('name')
        email = request.POST.get('email')
        content = request.POST.get('content')
        value = {'name': name, 'email': email,
                 'content': content, 'user_id': id}
        Board.objects.create(**value)
        kwargs = {'id': id, 'page': 1}
        return redirect(reverse('board', kwargs=kwargs))

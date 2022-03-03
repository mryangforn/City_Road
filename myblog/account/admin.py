from django.contrib import admin
from .models import MyUser
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _


@admin.register(MyUser)
class MyUserAdmin(UserAdmin):
    list_display = ['username', 'email',
                    'name', 'introduce',
                    'company', 'profession',
                    'address', 'telephone',
                    'wx', 'qq', 'wb', 'photo']
    fieldsets = list(UserAdmin.fieldsets)
    fieldsets[1] = (_('Personal info'),
                    {'fields': ('name', 'introduce',
                                'email', 'company',
                                'profession', 'address',
                                'telephone', 'wx',
                                'qq', 'wb', 'photo')})

    def get_queryset(self, request):
        qs = super(MyUserAdmin, self).get_queryset(request)
        return qs.filter(id=request.user.id)

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from extuser.models import MyUser, UsersGroupExtUser

# Register your models here.

class MyUserInline(admin.StackedInline):
    model = MyUser
    can_delete = False
    verbose_name_plural = 'users'

# Define a new User admin
class UserAdmin(UserAdmin):
    inlines = (MyUserInline, )

# Re-register UserAdmin
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(UsersGroupExtUser)

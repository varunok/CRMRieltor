# -*- coding: utf-8 -*-


from django.conf.urls import url
from extuser.views import user_list, login_user, logout_user, register, add_user, delete_user, LoginFormView, \
    send_recavery_pass


urlpatterns = [

    url(r'^accounts/login/$', LoginFormView.as_view(), name='login'),  # redirect to login form user
    url(r'^accounts/logining/$', login_user, name='logining'),  # login user and authenticate user
    url(r'^accounts/logout/$', logout_user, name='logout'),  # logout user
    url(r'^register$', register, name='register'),  # register user
    url(r'^setting/setting_user$', user_list, name='setting_user'),  # user list in setting user
    url(r'^add_user$', add_user, name='add_user'),  # add user
    url(r'^setting/setting_user/delete_user$', delete_user, name='delete_user'),  # delete user
    url(r'^accounts/login/recowery_pass$', send_recavery_pass),
]

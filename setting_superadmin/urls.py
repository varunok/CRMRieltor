# -*- coding: utf-8 -*-


from django.conf.urls import url
from setting_superadmin.views import list_setting_superadmin, all_to_call, save_call

urlpatterns = [
    url(r'list_setting_superadmin$', list_setting_superadmin, name='list_setting_superadmin'),
    url(r'all_to_call$', all_to_call, name='all_to_call'),
    url(r'^save_call$', save_call, name='save_call'),
    ]
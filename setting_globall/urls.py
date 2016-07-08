# -*- coding: utf-8 -*-


from django.conf.urls import url
from setting_globall.views import setting_globall, nat_currency


urlpatterns = [
    url(r'^setting_globall$', setting_globall, name='setting_globall'),
    url(r'^nat_currency$', nat_currency),
]
# -*- coding: utf-8 -*-


from django.conf.urls import url
from access.views import access, change_access_facility

urlpatterns = [
    url(r'^access$', access, name='access'),
    url(r'^change_access_facility$', change_access_facility),
]
# -*- coding: utf-8 -*-


from django.conf.urls import url
from facility.views import add_facility

urlpatterns = [
    url(r'^objects/add_facility$', add_facility, name='add_facility'),
]
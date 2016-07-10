# -*- coding: utf-8 -*-


from django.conf.urls import url
from facility.views import add_facility, check_phone, add_img, del_img

urlpatterns = [
    url(r'^objects/add_facility$', add_facility, name='add_facility'),
    url(r'^objects/check_phone$', check_phone),
    url(r'^objects/add_img$', add_img),
    url(r'^objects/del_img$', del_img),
]
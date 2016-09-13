# -*- coding: utf-8 -*-


from django.conf.urls import url
from setting_mail_delivery.views import setting_mail_delivery

urlpatterns = [
    url(r'^setting_mail_delivery$', setting_mail_delivery, name='setting_mail_delivery', ),
]

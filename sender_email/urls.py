# -*- coding: utf-8 -*-


from django.conf.urls import url
from sender_email.views import send_email_rieltor, send_email_so, delivery_email_arendator, delivery_email_buyer, \
    send_email_makler, delivery_sms_arendator


urlpatterns = [
    url(r'send_email_rieltor$', send_email_rieltor, name='send_email_rieltor'),
    url(r'send_email_so$', send_email_so, name='send_email_so'),
    url(r'delivery_email_arendator$', delivery_email_arendator),
    url(r'delivery_email_buyer$', delivery_email_buyer),
    url(r'send_email_makler$', send_email_makler),
    url(r'delivery_sms_arendator$', delivery_sms_arendator),
]

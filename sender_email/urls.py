# -*- coding: utf-8 -*-


from django.conf.urls import url
from sender_email.views import send_email_rieltor, send_email_so


urlpatterns = [
	url(r'send_email_rieltor$', send_email_rieltor, name='send_email_rieltor'),
	url(r'send_email_so$', send_email_so, name='send_email_so'),
]
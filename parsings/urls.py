# -*- coding: utf-8 -*-


from django.conf.urls import url
from parsings.views import services, parser_olx


urlpatterns = [
    url(r'services$', services, name='services'),
    url(r'parser_olx$', parser_olx, name='parser_olx'),
]
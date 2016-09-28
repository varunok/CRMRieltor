# -*- coding: utf-8 -*-


from django.conf.urls import url
from single_arendator.views import SingleArendatorView


urlpatterns = [
    url(r'^(?P<aid>[0-9]+)$', SingleArendatorView.as_view(), name='single_arendator'),
]
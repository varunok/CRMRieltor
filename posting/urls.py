# -*- coding: utf-8 -*-


from django.conf.urls import url
from posting.views import posting_true


urlpatterns = [
    url(r'post/false$', posting_true, name='posting_true'),
]
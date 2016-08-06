# -*- coding: utf-8 -*-


from django.conf.urls import url
from tasking.views import get_form_task


urlpatterns = [
    url(r'get_form_task$', get_form_task, name='get_form_task'),
]
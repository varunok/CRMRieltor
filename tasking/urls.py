# -*- coding: utf-8 -*-


from django.conf.urls import url
from tasking.views import get_form_task, save_form_tasking, to_archive, search_task


urlpatterns = [
    url(r'get_form_task$', get_form_task, name='get_form_task'),
    url(r'save_form_tasking$', save_form_tasking),
    url(r'to_archive$', to_archive),
    url(r'search_task$', search_task),
]
# -*- coding: utf-8 -*-


from django.conf.urls import url
from arendator.views import add_arendator_obj, change_call_date, ArendatorListSearch, trash_arendator, edit_arendator, \
    save_edit_arendator


urlpatterns = [
    url(r'add_arendator_obj$', add_arendator_obj, name='add_arendator_obj'),
    url(r'^change_call_date$', change_call_date, name='change_call_date'),
    url(r'search_arendator$', ArendatorListSearch.as_view(), name='search_arendator'),
    url(r'trash_arendator$', trash_arendator),
    url(r'^edit_arendator/(?P<id_arendator>[0-9]+)$', edit_arendator, name='edit_arendator'),
    url(r'^edit_arendator/save_edit_arendator$', save_edit_arendator),
]

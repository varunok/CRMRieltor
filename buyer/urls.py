# -*- coding: utf-8 -*-


from django.conf.urls import url
from buyer.views import add_buyer_obj, change_call_date, BuyerListSearch, trash_buyer, edit_buyer, save_edit_buyer

urlpatterns = [
    url(r'add_buyer_obj$', add_buyer_obj, name='add_buyer_obj'),
    url(r'^change_call_date$', change_call_date, name='change_call_date'),
    url(r'search_buyer$', BuyerListSearch.as_view(), name='search_buyer'),
    url(r'trash_buyer$', trash_buyer),
    url(r'^edit_buyer/(?P<id_buyer>[0-9]+)$', edit_buyer, name='edit_buyer'),
    url(r'^edit_buyer/save_edit_buyer$', save_edit_buyer),
]
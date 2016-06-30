# -*- coding: utf-8 -*-


from django.conf.urls import url
from setting_street.views import street_list, add_street, delete_street

urlpatterns = [
    # start settings street objects
    url(r'^setting/setting_street$', street_list, name='setting_street'),
    url(r'^setting/add_street$', add_street),
    url(r'^setting/delete_street$', delete_street),
    # end settings street objects
]

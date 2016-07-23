# -*- coding: utf-8 -*-


from django.conf.urls import url
from single_object.views import SingleObjectView, change_call_date, change_review_date, change_actuality, \
    add_obj_comment, del_comment, get_arendator, get_comment, get_buyer, get_publication, get_meetings, \
    get_tasks, DatabasesPrevious

urlpatterns = [
     url(r'^(?P<oid>[0-9]+)$', SingleObjectView.as_view(), name='single_obj'),
     url(r'^change_call_date$', change_call_date, name='change_call_date'),
     url(r'^change_review_date$', change_review_date, name='change_review_date'),
     url(r'^change_actuality$', change_actuality, name='change_actuality'),
     url(r'^add_obj_comment$', add_obj_comment, name='add_obj_comment'),
     url(r'^del_comment$', del_comment, name='del_comment'),
     url(r'^get_arendator$', get_arendator, name='get_arendator'),
     url(r'^get_comment$', get_comment, name='get_comment'),
     url(r'^get_buyer$', get_buyer, name='get_buyer'),
     url(r'^get_publication$', get_publication, name='get_publication'),
     url(r'^get_meetings$', get_meetings, name='get_meetings'),
     url(r'^get_tasks$', get_tasks, name='get_tasks'),
     url(r'^data/(?P<poid>[0-9]+)$', DatabasesPrevious.as_view(), name='databases'),
]

# -*- coding: utf-8 -*-


from django.conf.urls import url
from trash_object.views import go_trash, list_trash, ObjectListTrash, del_obj

urlpatterns = [
    url(r'^list_trash$', list_trash, name='list_trash'),
    url(r'^objects_trash$', ObjectListTrash.as_view(), name='objects_trash'),
    url(r'^go_trash$', go_trash),
    url(r'^del_obj$', del_obj),
]

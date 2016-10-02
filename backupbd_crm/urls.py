# -*- coding: utf-8 -*-


from django.conf.urls import url
from backupbd_crm.views import list_backup, backup_xls, create_object_xls, backup_global, get_backup_global


urlpatterns = [
    url(r'^list_backup$', list_backup, name='list_backup'),
    url(r'^backup_xls$', backup_xls, name='backup_xls'),
    url(r'^create_object_xls$', create_object_xls),
    url(r'^backup_global$', backup_global, name='backup_global'),
    url(r'^get_backup_global$', get_backup_global, name='get_backup_global'),
]
# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .writeXLS import WriteXLS
from .backup_objects import title, SaveConOwn


def list_backup(request):
    return render(request, 'backupbd_crm/list_backup.html', {})


def backup_xls(request):
    # if request.method == 'POST':
    return render(request, 'backupbd_crm/backup_xls.html', {})


def create_object_xls(request):
    facilitis = SaveConOwn.objects.all()
    path_to_file = WriteXLS('objects', facilitis, title).write_table()
    return HttpResponse(path_to_file)

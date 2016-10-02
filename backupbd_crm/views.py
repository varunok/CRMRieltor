# -*- coding: utf-8 -*-


import subprocess
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.conf import settings
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


def backup_global(request):
    return render(request, 'backupbd_crm/backup_global.html', {})


def get_backup_global(request):
    # path_to_python = ''
    cmd = './manage.py dbbackup'
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE,
                         stderr=subprocess.STDOUT, close_fds=True)
    p = p.stdout.read()
    p = p.split(' ')[-1]
    path_to_file = ''.join([settings.MEDIA_URL, 'backup_global/', p])
    return HttpResponse(path_to_file)

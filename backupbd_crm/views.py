# -*- coding: utf-8 -*-


import os
import subprocess
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.conf import settings
from .writeXLS import WriteXLS
from .backup_objects import title, SaveConOwn


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


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
    path = ''.join([BASE_DIR, '/media/backup_global/backup.psql'])
    # cmd = ''.join([BASE_DIR, '/../data/bin/python', ' manage.py dbbackup --output-path ', path])
    cmd = ''.join(['./manage.py dbbackup --output-path ', path])
    # cmd = ''.join([BASE_DIR, '/../data/bin/python', ' manage.py dbbackup'])
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE,
                         stderr=subprocess.STDOUT, close_fds=True, cwd=BASE_DIR)
    p = p.stdout.read()
    print(p)
    p = p.split(' ')[-1].strip()
    path_to_file = ''.join([settings.MEDIA_URL, 'backup_global/', p])
    return HttpResponse(path_to_file)


def restore_file_save(request):
    if request.method == 'POST':
        path = ''.join([BASE_DIR, '/media/restore'])
        try:
            list_file = os.listdir('media/restore/')
            for ele in list_file:
                os.remove(''.join(('media/restore/', ele)))
        except:
            pass
        try:
            os.mkdir(path)
        except:
            pass
        file = request.FILES
        valid = file['0'].name
        valid = valid.split('.')[-1]
        if valid == 'psql':
            with open(path + '/' + file['0'].name, 'wb+') as destination:
                for chunk in file['0'].chunks():
                    destination.write(chunk)
            return HttpResponse(content=b'ok')
        else:
            return HttpResponse(status=500, content=b'bad file')


def restore_databases(request):
    list_file = os.listdir('media/restore/')
    # cmd = ''.join(['./manage.py dbrestore --noinput --input-path ', BASE_DIR, '/media/restore/', list_file[0]])
    cmd = ''.join([BASE_DIR, '/../data/bin/python', ' manage.py dbrestore --noinput --input-path ', BASE_DIR, '/media/restore/', list_file[0]])
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE,
                         stderr=subprocess.STDOUT, close_fds=True, cwd=BASE_DIR)
    p = p.stdout.read()
    print(p)
    return HttpResponse(p)


def backup_dropbox(request):
    settings.DBBACKUP_STORAGE = 'storages.backends.dropbox.DropBoxStorage'
    settings.DBBACKUP_STORAGE_OPTIONS = {
        'oauth2_access_token': '8M3Y_7ZcqZYAAAAAAAACWme1Wfl_Xgf7KygE_GRVgFkB7cU_hjNff6HErG3_gQWi',
    }
    cmd = ''.join(['./manage.py dbbackup'])
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE,
                         stderr=subprocess.STDOUT, close_fds=True, cwd=BASE_DIR)
    p = p.stdout.read()
    print(p)
    # p = p.split(' ')[-1].strip()
    # path_to_file = ''.join([settings.MEDIA_URL, 'backup_global/', p])
    return HttpResponse(p)

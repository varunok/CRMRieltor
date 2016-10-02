# -*- coding: utf-8 -*-

import xlwt
import uuid
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from facility.models import ContactOwner


def list_backup(request):
    return render(request, 'backupbd_crm/list_backup.html', {})


def backup_xls(request):
    if request.method == 'POST':
        return render(request, 'backupbd_crm/backup_xls.html', {})


def create_object_xls(request):
    facilitis = ContactOwner.objects.all()
    WriteXLS().write_table(facilitis)
    return HttpResponse(status=200)

class WriteXLS(object):
    """docstring for WriteXLS"""
    def __init__(self):
        pass

    def write_table(self, data):
        # try:
            wb = xlwt.Workbook()
            ws = wb.add_sheet('Sheet Phone')
            for obj in data:
                obj = obj.filter()
                for elem in obj:
                    ws.write(data.index(obj), obj.index(elem), str(elem))
            wb.save(''.join(["object-", str(uuid.uuid1()), "-.xls"]))
            return True
        # except:
            # return None

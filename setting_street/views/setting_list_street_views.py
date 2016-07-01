# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.utils import timezone, dateformat

def setting_list_street(request):
    return render(request, 'setting_street/setting_list_street.html', {'time': timezone.now()})

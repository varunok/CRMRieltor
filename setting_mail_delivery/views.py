# -*- coding: utf-8 -*-


from django.shortcuts import render
# from django.http import HttpResponserr

# Create your views here.


def setting_mail_delivery(request):
    return render(request, 'setting_mail_delivery/setting_mail_delivery.html', )

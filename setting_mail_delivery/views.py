# -*- coding: utf-8 -*-


from django.shortcuts import render
# from django.http import HttpResponserr
from setting_mail_delivery.models import TemplateSms, TemplateEmail, SettingSMS
from setting_mail_delivery.forms import TemplateSmsForm, TemplateEmailForm, SettingSMSForm

# Create your views here.


def setting_mail_delivery(request):
    return render(request, 'setting_mail_delivery/setting_mail_delivery.html')


def sms_template(request):
    temp_sms_form, create = TemplateSms.objects.get_or_create(id=1)
    if create:
        form = TemplateSmsForm()
    else:
        form = TemplateSmsForm(instance=temp_sms_form)
    return render(request, 'setting_mail_delivery/sms_template.html', {"form": form})


def save_sms_template_form(request):
    temp_sms_form, create = TemplateSms.objects.get_or_create(id=1)
    if request.method == 'POST':
        form = TemplateSmsForm(request.POST, instance=temp_sms_form)
        if form.is_valid():
            form.save()
            return setting_mail_delivery(request)
    else:
        form = TemplateSmsForm()

    return render(request, 'setting_mail_delivery/sms_template.html', {"form": form})


def email_template(request):
    temp_email_form, create = TemplateEmail.objects.get_or_create(id=1)
    if create:
        form = TemplateEmailForm()
    else:
        form = TemplateEmailForm(instance=temp_email_form)
    return render(request, 'setting_mail_delivery/email_template.html', {"form": form,
                                                                         "temp_email_form": temp_email_form})


def save_email_template_form(request):
    temp_email_form, create = TemplateEmail.objects.get_or_create(id=1)
    if request.method == 'POST':
        form = TemplateEmailForm(request.POST, request.FILES, instance=temp_email_form)
        if form.is_valid():
            form.save()
            return setting_mail_delivery(request)
    else:
        form = TemplateEmailForm()

    return render(request, 'setting_mail_delivery/email_template.html', {"form": form,
                                                                         "temp_email_form": temp_email_form})


def sms_setting(request):
    setting_sms, create = SettingSMS.objects.get_or_create(id=1)
    if create:
        form = SettingSMSForm()
    else:
        form = SettingSMSForm(instance=setting_sms)
    return render(request, 'setting_mail_delivery/sms_setting.html', {"form": form})


def save_sms_setting(request):
    setting_sms, create = SettingSMS.objects.get_or_create(id=1)
    if request.method == 'POST':
        form = SettingSMSForm(request.POST, instance=setting_sms)
        if form.is_valid():
            form.save()
            return setting_mail_delivery(request)
    else:
        form = SettingSMSForm()
    return render(request, 'setting_mail_delivery/sms_setting.html', {"form": form})

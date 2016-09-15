# -*- coding: utf-8 -*-


import threading
from django.shortcuts import render, get_object_or_404
from django.template.loader import render_to_string
from django.http import HttpResponse, JsonResponse
from django.core.mail import send_mail
from django.core.mail.backends.smtp import EmailBackend
from django.core.mail import EmailMessage
from setting_superadmin.models import AllToConnect
from setting_mail_delivery.models import TemplateEmail, TemplateSms
from single_object.models import ContactOwner
from arendator.models import Arendator
from buyer.models import Buyer
from makler.models import Makler
from suds.client import Client
# from crm.settings import EMAIL_HOST, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD


class RieltorEmailBackend(EmailBackend):
    """docstring for ClassName"""

    def __init__(self, host=None, port=None, username=None, password=None,
                 use_tls=None, fail_silently=False, use_ssl=None, timeout=None, **kwargs):
        super(RieltorEmailBackend, self).__init__(fail_silently=fail_silently)
        self.host = host
        self.port = port
        self.username = username
        self.password = password
        self.use_tls = use_tls
        self.use_ssl = use_ssl
        self.timeout = timeout
        if self.use_ssl and self.use_tls:
            raise ValueError(
                "EMAIL_USE_TLS/EMAIL_USE_SSL are mutually exclusive, so only set "
                "one of those settings to True.")
        self.connection = None
        self._lock = threading.RLock()


EMAIL_HOST = 'mail.testcrm.gek.od.ua'
EMAIL_HOST_USER = 'rieltor@testcrm.gek.od.ua'
EMAIL_HOST_PASSWORD = 'Varunok13'

connect = RieltorEmailBackend(host=EMAIL_HOST, port=587, username=EMAIL_HOST_USER,
                              password=EMAIL_HOST_PASSWORD, use_tls=True, fail_silently=False, use_ssl=False,
                              timeout=90)


def send_email_rieltor(request):
    if request.method == 'POST' and request.is_ajax():
        message = request.POST.get('text')
        email_to = AllToConnect.objects.filter(pk=1)
        sending = send_mail('HELLO', message, 'rieltor@testcrm.gek.od.ua', [email_to[0].email], fail_silently=False)
        print(sending)
        return HttpResponse(sending)
    else:
        return HttpResponse(status=500)


def send_email_so(request):
    if request.method == 'POST':
        request_abs_url = request.build_absolute_uri('media').replace('objects/', '')
        temp_email = get_object_or_404(TemplateEmail, pk=1)
        single_object = ContactOwner.objects.get(id=request.POST.get('id_so'))
        html_message = render_to_string('sender_email/template_email.html', {'temp_email': temp_email,
                                                                             'request': request_abs_url,
                                                                             'single_object': single_object})

        email = EmailMessage(temp_email.title, html_message, is_sender_address_valid(temp_email.sender_address),
                             [request.POST.get('email')], [request.POST.get('email')])

        email.content_subtype = "html"
        connect.open()
        sending = connect.send_messages([email])
        connect.close()
        return HttpResponse(sending)


def is_sender_address_valid(sender_address):
    sender_address_is_valid = sender_address.split('@')[-1]
    email_host_is_valid = EMAIL_HOST_USER.split('@')[-1]
    if sender_address_is_valid != email_host_is_valid:
        return EMAIL_HOST_USER
    return sender_address


def delivery_email_arendator(request):
    if request.method == 'POST':
        request_abs_url = request.build_absolute_uri('media').replace('objects/', '')
        temp_email = get_object_or_404(TemplateEmail, pk=1)
        single_object = ContactOwner.objects.get(id=request.POST.get('id_so'))
        html_message = render_to_string('sender_email/template_email.html', {'temp_email': temp_email,
                                                                             'request': request_abs_url,
                                                                             'single_object': single_object})
        arendator_emails = Arendator.objects.filter(id__in=[i for i in list(
            request.POST.getlist('id_a')[0]) if i != ',']).values_list('email', flat=True)

        connect.open()
        for arendator_email in arendator_emails:
            email = EmailMessage(temp_email.title, html_message, is_sender_address_valid(temp_email.sender_address),
                                 [arendator_email], [])
            email.content_subtype = "html"
            sending = connect.send_messages([email])
        connect.close()
        return HttpResponse(sending)
    else:
        return HttpResponse(status=500)


def delivery_email_buyer(request):
    if request.method == 'POST':
        request_abs_url = request.build_absolute_uri('media').replace('objects/', '')
        temp_email = get_object_or_404(TemplateEmail, pk=1)
        single_object = ContactOwner.objects.get(id=request.POST.get('id_so'))
        html_message = render_to_string('sender_email/template_email.html', {'temp_email': temp_email,
                                                                             'request': request_abs_url,
                                                                             'single_object': single_object})
        buyer_emails = Buyer.objects.filter(id__in=[i for i in list(
            request.POST.getlist('id_b')[0]) if i != ',']).values_list('email', flat=True)

        connect.open()
        count_sending_email = 0
        for buyer_email in buyer_emails:
            email = EmailMessage(temp_email.title, html_message, is_sender_address_valid(temp_email.sender_address),
                                 [buyer_email], [])
            email.content_subtype = "html"
            sending = connect.send_messages([email])
            if sending:
                count_sending_email += 1
        connect.close()
        return HttpResponse(count_sending_email)
    else:
        return HttpResponse(status=500)


def send_email_makler(request):
    if request.method == 'POST':
        emails = Makler.objects.values_list('email', flat=True)
        connect.open()
        count_sending_email = 0
        for email in emails:
            email = EmailMessage(request.POST.get('subject'), request.POST.get('body'),
                                 is_sender_address_valid(EMAIL_HOST_USER),
                                 [email], [])
            sending = connect.send_messages([email])
            if sending:
                count_sending_email += 1
        connect.close()
        return HttpResponse(count_sending_email)
    else:
        return HttpResponse(status=500)


def delivery_sms_arendator(request):
    if request.method == 'POST':
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=500)

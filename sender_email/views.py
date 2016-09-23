# -*- coding: utf-8 -*-


import threading
from django.shortcuts import render, get_object_or_404
from django.template.loader import render_to_string
from django.http import HttpResponse, JsonResponse
from django.core.mail import send_mail
from django.core.mail.backends.smtp import EmailBackend
from django.core.mail import EmailMessage
from setting_superadmin.models import AllToConnect
from setting_mail_delivery.models import TemplateEmail, TemplateSms, SettingSMS, SettingEmail
from single_object.models import ContactOwner
from arendator.models import Arendator
from buyer.models import Buyer
from makler.models import Makler
from suds.client import Client
from django.conf import settings
# from crm.settings import EMAIL_HOST, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD


EMAIL_HOST_USER = settings.EMAIL_HOST_USER

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


def send_mail_php(from_addr, to_addr, subject, body):
    cmdline = ["/usr/sbin/sendmail", "-f"]
    cmdline.append(from_addr)
    cmdline.append(to_addr)
    mailer = subprocess.Popen(cmdline, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    dialog = "From: %s\nTo: %s\nSubject: %s\n\n%s\n.\n" % (from_addr, to_addr, subject, body)
    return mailer.communicate(dialog)



def connect_rieltor():
    rieltor_email_setting = get_object_or_404(SettingEmail, id=1)
    EMAIL_HOST = str(rieltor_email_setting.host.split('//')[-1])
    EMAIL_HOST_USER = str(rieltor_email_setting.host_user)
    EMAIL_HOST_PASSWORD = str(rieltor_email_setting.password)
    EMAIL_TIMEOUT = int(rieltor_email_setting.timeout)
    connect = RieltorEmailBackend(host=EMAIL_HOST, port=587, username=EMAIL_HOST_USER,
                                  password=EMAIL_HOST_PASSWORD, use_tls=True, fail_silently=False, use_ssl=False,
                                  timeout=EMAIL_TIMEOUT)
    return connect


def send_email_rieltor(request):
    if request.method == 'POST' and request.is_ajax():
        message = request.POST.get('text')
        temp_email = get_object_or_404(TemplateEmail, pk=1)
        email_to = AllToConnect.objects.filter(pk=1)
        email_from = is_sender_address_valid(temp_email.sender_address)
        subject = "Сообщение из футера"
        sending = send_mail_php(email_from, email_to[0].email, subject, message)
        # sending = send_mail('HELLO', message, 'rieltor@dom6.dom.zt.ua', [email_to[0].email], fail_silently=False)
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

        # email = EmailMessage(temp_email.title, html_message, is_sender_address_valid(temp_email.sender_address),
        #                      [request.POST.get('email')], [request.POST.get('email')])

        # email.content_subtype = "html"
        # connect = connect_rieltor()
        # connect.open()
        # sending = connect.send_messages([email])
        # connect.close()
        sending = send_mail_php(is_sender_address_valid(temp_email.sender_address), request.POST.get('email'), temp_email.title, html_message)

        return HttpResponse(sending)


def is_sender_address_valid(sender_address):
    rieltor_email_setting = get_object_or_404(SettingEmail, id=1)
    EMAIL_HOST_USER = str(rieltor_email_setting.host_user)
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
        arendator_emails = [i for i in arendator_emails if i != '']
        connect = connect_rieltor()
        connect.open()
        count_sending = 0
        for arendator_email in arendator_emails:
            email = EmailMessage(temp_email.title, html_message, is_sender_address_valid(temp_email.sender_address),
                                 [arendator_email], [])
            email.content_subtype = "html"
            sending = connect.send_messages([email])
            if sending:
                count_sending += 1
        connect.close()
        return HttpResponse(count_sending)
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
        buyer_emails = [i for i in buyer_emails if i != '']
        connect = connect_rieltor()
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
        emails = [i for i in emails if i != '']
        connect = connect_rieltor()
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
    """# Auth(xs:string login, xs:string password, )
       # GetCreditBalance()
       # GetMessageStatus(xs:string MessageId, )
       # GetNewMessages()
       # SendSMS(xs:string sender, xs:string destination, xs:string text, xs:string wappush, )
    """
    if request.method == 'POST':
        single_object = ContactOwner.objects.get(id=request.POST.get('id_so'))
        setting_sms = get_object_or_404(SettingSMS, id=1)
        arendator_phone = Arendator.objects.filter(id__in=[i for i in list(
            request.POST.getlist('id_a')[0]) if i != ',']).values_list('phone_first', flat=True)
        print()
        client = Client('http://turbosms.in.ua/api/wsdl.html')
        # auth = client.service.Auth(login='crm', password='sin1984')
        auth = client.service.Auth(login=setting_sms.login, password=setting_sms.password)
        count_message = 0
        if auth == u'Вы успешно авторизировались':
            balance = client.service.GetCreditBalance()
            if float(balance):
                result = client.service.SendSMS(sender=setting_sms.sender,
                                                destination=list_phone_validate(arendator_phone),
                                                text=link_to_single_obj(single_object, 'arendator'))
                for i in result['ResultArray'][1:]:
                    status = client.service.GetMessageStatus(MessageId=i)
                    if status == u'Отправлено':
                        count_message += 1
                return HttpResponse(count_message)
            else:
                balance = u'Ваш баланс ' + balance
                return HttpResponse(balance, status=500)
        else:
            return HttpResponse(auth, status=500)
    else:
        return HttpResponse(status=500)


def list_phone_validate(list_phone):
    list_phone = [str(i) for i in list(list_phone)]
    new_list_phone = []
    for phone in list_phone:
        if len(phone) == 12 and int(phone[0]) == 3:
            new_list_phone.append(''.join(['+', phone]))
        elif len(phone) == 11 and int(phone[0]) == 8:
            new_list_phone.append(''.join(['+3', phone]))
        elif len(phone) == 10 and int(phone[0]) == 0:
            new_list_phone.append(''.join(['+38', phone]))
        elif len(phone) == 9:
            new_list_phone.append(''.join(['+380', phone]))
    del list_phone
    return ','.join(new_list_phone)


def link_to_single_obj(single_object, type_kontagent):
    from crm.settings import ALLOWED_HOSTS
    templ_sms = get_object_or_404(TemplateSms, id=1)
    address = single_object.street_obj
    if type_kontagent == 'arendator':
        price = single_object.price_month
    elif type_kontagent == 'buyer':
        price = single_object.price_bay
    link = ''.join([ALLOWED_HOSTS[0], '/objects/data/', str(single_object.id)])
    landmark = single_object.landmark
    link = '.'.join([templ_sms.title, templ_sms.text, landmark, unicode(address),
                      str(price), link, templ_sms.signature])
    return link

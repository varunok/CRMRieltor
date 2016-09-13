# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.core.mail import send_mail
from setting_superadmin.models import AllToConnect
from django.template.loader import render_to_string
from single_object.models import ContactOwner


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
	if requesr.method == 'POST':

		html_message = render_to_string('single_object/previous.html', {})

		sending = send_mail('HELLO', 'message', 'rieltor@testcrm.gek.od.ua', ['varunok13@gmail.com'], fail_silently=False, html_message=html_message)
		return HttpResponse(sending)
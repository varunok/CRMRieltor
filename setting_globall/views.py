# -*- coding: utf-8 -*-


# Create your views here.
from django.db import DataError
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.utils import timezone, dateformat
from setting_globall.models import NationalCarrency, ListNationalCarrency


def setting_globall(request):
    list_currency = ListNationalCarrency.objects.all()
    nat_curr = NationalCarrency.objects.get(id=1)
    return render(request, 'setting_globall/setting_globall.html', {'time': timezone.now(),
                                                                    'list_currency': list_currency,
                                                                    'nat_curr': nat_curr})


def nat_currency(request):
    if request.method == 'POST':
        try:
            if NationalCarrency.objects.filter(id=1):
                add_currency = NationalCarrency.objects.get(id=1)
                add_currency.currency = request.POST['carrency']
                add_currency.save()
                return HttpResponse(u'Значение изменено')
            else:
                add_currency = NationalCarrency(currency=request.POST['carrency'])
                add_currency.save()
                add_currency = NationalCarrency(currency='$')
                add_currency.save()
                return HttpResponse(u'Значение сохранено')
        except DataError:
            return HttpResponse(u'Ошибка')
    return HttpResponse(u'Ошибка')

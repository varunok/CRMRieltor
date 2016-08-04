# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from buyer.forms import BuyerForm
from homes.views import add_buyer, BuyersList
from change_form import change_form_text
from buyer.models import Buyer
from datetime import datetime
from django.utils import timezone, dateformat
from search_buyer import searh
from django.contrib.auth.models import User


def add_buyer_obj(request):
    if request.method == 'POST':
        form = BuyerForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/buyers')
        else:
            form = change_form_text(form)
        return add_buyer(request, form)


def change_call_date(request):
    id_ar = request.GET['id'].split('-')[-1]
    buyer = Buyer.objects.get(id=id_ar)
    date_request = datetime.strptime(str(request.GET['date']), "%m/%d/%Y")
    date_change = dateformat.format(date_request, 'Y-m-d')
    buyer.call_date = date_change
    buyer.save()
    return HttpResponse("ok")


class BuyerListSearch(BuyersList):
    """docstring for ObjectListSearch"""
    template_name = "buyer/search.html"

    def get_queryset(self):
        return searh(self.request)


def trash_buyer(request):
    if request.method == 'POST':
        id_obj = request.POST.get('trash')
        trash_obj = Buyer.objects.get(id=id_obj)
        user = User.objects.get(id=request.POST.get('iduser'))
        trash_obj.trash = True
        trash_obj.time_trash = timezone.now()
        trash_obj.name_user_trash = user.get_full_name()
        trash_obj.save()
        return HttpResponse("Обьект 'Покупатель' перемещен в корзину")
    else:
        return HttpResponse("Ошибка")

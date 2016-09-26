# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from arendator.forms import ArendatorForm
from homes.views import add_arendator, ArendatorsList
from change_form import change_form_text
from arendator.models import Arendator
from datetime import datetime
from django.utils import timezone, dateformat
from search_arendator import searh
from django.contrib.auth.models import User


def add_arendator_obj(request):
    if request.method == 'POST':
        form = ArendatorForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/arendators')
        else:
            form = change_form_text(form)
    else:
        form = ArendatorForm()
    return add_arendator(request, form)


def save_edit_arendator(request):
    if request.method == 'POST':
        arendator = Arendator.objects.get(id=request.POST.get('edit'))
        form = ArendatorForm(request.POST, instance=arendator)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/arendators')
        else:
            form = change_form_text(form)
    else:
        form = ArendatorForm()
    return edit_arendator(request, request.POST.get('edit'))


def change_call_date(request):
    id_ar = request.GET['id'].split('-')[-1]
    arendator = Arendator.objects.get(id=id_ar)
    date_request = datetime.strptime(str(request.GET['date']), "%m/%d/%Y")
    date_change = dateformat.format(date_request, 'Y-m-d')
    arendator.call_date = date_change
    arendator.save()
    return HttpResponse("ok")


class ArendatorListSearch(ArendatorsList):
    """docstring for ObjectListSearch"""
    template_name = "arendator/search.html"

    def get_queryset(self):
        return searh(self.request)


def trash_arendator(request):
    if request.method == 'POST':
        id_obj = request.POST.get('trash')
        trash_obj = Arendator.objects.get(id=id_obj)
        user = User.objects.get(id=request.POST.get('iduser'))
        trash_obj.trash = True
        trash_obj.time_trash = timezone.now()
        trash_obj.name_user_trash = user.get_full_name()
        trash_obj.save()
        return HttpResponse("Обьект 'Арендатор' перемещен в корзину")
    else:
        return HttpResponse("Ошибка")


def edit_arendator(request, id_arendator):
    arendator = Arendator.objects.get(id=id_arendator)
    form = ArendatorForm(instance=arendator)
    return render(request, 'homes/add_arendator.html', {'form': form, 'edit': True, 'id_arendator': id_arendator})

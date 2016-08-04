# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone
from homes.views import ObjectList, ArendatorsList, BuyersList
from facility.models import ContactOwner
from arendator.models import Arendator
from buyer.models import Buyer

# Create your views here.


def list_trash(request):
    return render(request, 'trash_object/list_trash.html', {'time': timezone.now()})


class ObjectListTrash(ObjectList):
    """docstring for ClassName"""
    template_name = 'trash_object/objects_trash.html'
    qeryset = ContactOwner.objects.filter(trash=1)


class ArendatorListTrash(ArendatorsList):
    """docstring for ClassName"""
    template_name = 'trash_object/arendator_trash.html'
    qeryset = Arendator.objects.filter(trash=1)


class BuyerListTrash(BuyersList):
    """docstring for ClassName"""
    template_name = 'trash_object/buyer_trash.html'
    qeryset = Buyer.objects.filter(trash=1)


def del_obj(request):
    if request.method == 'POST':
        id_obj = request.POST.get('del')
        ContactOwner.objects.get(id=id_obj).delete()
        return HttpResponse(u"Обьект удален")
    else:
        return HttpResponse(u"Ошибка удаления")

def del_arendator(request):
    if request.method == 'POST':
        id_obj = request.POST.get('del')
        Arendator.objects.get(id=id_obj).delete()
        return HttpResponse(u"Обьект удален")
    else:
        return HttpResponse(u"Ошибка удаления")


def del_buyer(request):
    if request.method == 'POST':
        id_obj = request.POST.get('del')
        Buyer.objects.get(id=id_obj).delete()
        return HttpResponse(u"Обьект удален")
    else:
        return HttpResponse(u"Ошибка удаления")


def go_trash(request):
    pass

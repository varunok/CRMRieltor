# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone
from homes.views import ObjectList, ArendatorsList, BuyersList
from facility.models import ContactOwner
from arendator.models import Arendator
from buyer.models import Buyer
from send_messege_user.models import UserMessage

# Create your views here.


def list_trash(request):
    return render(request, 'trash_object/list_trash.html', {'time': timezone.now()})


class ObjectListTrash(ObjectList):
    """docstring for ClassName"""
    template_name = 'trash_object/objects_trash.html'
    qeryset = ContactOwner.objects.filter(trash=True)


class ArendatorListTrash(ArendatorsList):
    """docstring for ClassName"""
    template_name = 'trash_object/arendator_trash.html'
    queryset = Arendator.objects.all().filter(trash=True)
    context_object_name = 'arendator_list'


class BuyerListTrash(BuyersList):
    """docstring for ClassName"""
    template_name = 'trash_object/buyer_trash.html'
    queryset = Buyer.objects.all().filter(trash=True)


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


def archiv_email(request):
    messages = UserMessage.objects.filter(read=True)
    print(messages)
    return render(request, 'trash_object/archiv_email.html', {'time': timezone.now(),
                                                              'messages': messages})

def delete_message(request):
    if request.method == 'POST':
        id_message = request.POST['id']
        # ff = UserMessage.objects.get(id=id_message)
        # print ff
        UserMessage.objects.get(id=id_message).delete()
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=404)

def go_trash(request):
    pass

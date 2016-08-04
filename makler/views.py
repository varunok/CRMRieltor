# -*- coding: utf-8 -*-


from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from makler.forms import MaklerForm
from makler.models import Makler
from django.views.generic import ListView
from homes.views import MaklerList
from django.core.mail import send_mail

# Create your views here.


class MaklerListWhite(MaklerList):
    qeryset = Makler.objects.filter(white_black=1)

    def get_queryset(self):
        return self.qeryset


class MaklerListBlack(MaklerList):
    qeryset = Makler.objects.filter(white_black=2)

    def get_queryset(self):
        return self.qeryset

def add_makler(request):
    if request.method == 'POST':
        form = MaklerForm(request.POST)
        if form.is_valid():
            form.save()
            post = Makler.objects.last()
            return render(request, 'makler/single_makler.html', {"makler": post})
        else:
            # form = change_form_text(form)
            form = MaklerForm(request.POST)
        return form_makler(request, form)
    else:
        return HttpResponse(status=404)

def form_makler(request, form=MaklerForm(),):
    if form.errors:
        return render(request, 'makler/form.html', {"form": form}, status=404)
    return render(request, 'makler/form.html', {"form": form})

def edit_makler(request):
    if request.method == 'POST':
        post = get_object_or_404(Makler, pk=request.POST.get('id'))
        form = MaklerForm(instance=post)
        return render(request, 'makler/edit_makler.html', {"form": form, "id_makler":post})
    else:
        return HttpResponse(status=404)


def save_edit_makler(request, id):
    if request.method == 'POST':
        post = get_object_or_404(Makler, pk=id)
        form = MaklerForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            return render(request, 'makler/single_makler.html', {"makler": post})
        else:
            form = MaklerForm(request.POST, instance=post)
            return render(request, 'makler/edit_makler.html', {"form": form, "id_makler":post}, status=404)
    else:
        return HttpResponse(status=404)



def send_email_makler(request):

    s = send_mail('Hello',
                  'fisdfjsfi',
                  'ddd@ddd.ddd',
                  ['varunok13@gmail.com'],
                  fail_silently=False,
                  auth_user='varunok13',
                  auth_password='varunokpython',)
    return HttpResponse(s)

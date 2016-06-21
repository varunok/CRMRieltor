# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse

from notes.models import Notes


# Create your views here.
def views(request):
    notes = Notes.objects.all()
    return render(request, 'homes/index.html', {'notes': notes})


def object(request):
    return render(request, 'homes/object.html', {})


def buyers(request):
    return render(request, 'homes/buyers.html', {})

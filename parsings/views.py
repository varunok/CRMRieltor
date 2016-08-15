# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect

from parser_olx import parsing

# Create your views here.


def services(request):
    return render(request, 'parsings/services.html', {})

def parser_olx(request):
    return render(request, 'parsings/parser_olx.html', {})

def parse(request):
    return HttpResponse(parsing())

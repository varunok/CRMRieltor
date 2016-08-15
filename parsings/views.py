# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect

from parser_olx import ParserOLX

# Create your views here.


def services(request):
    return render(request, 'parsings/services.html', {})

def parser_olx(request):
    # list_categories = ParserOLX('http://olx.ua').getlink()
    list_categories_text = ParserOLX('http://olx.ua').gettext()
    print str(list_categories_text)
    ger = [u"OKI"]
    return render(request, 'parsings/parser_olx.html', {"list_categories_text": list_categories_text,
                                                        "oki": ger})

def parse(request):
    # return HttpResponse(ParserOLX())
    return HttpResponse(status=200)

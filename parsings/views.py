# -*- coding: utf-8 -*-


import json
import re
import datetime
import goslate
from django.utils import timezone
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect

from setting_globall.models import FranshiseSity
from parser_olx import ParserOLX, mutable_month, mutable_phone
from makler.models import Makler
from facility.models import ContactOwner

# Create your views here.

SITE_URL = 'http://olx.ua'
AJAX_PHONE = '/ajax/misc/contact/phone/'
SELECTOR_GETLINK_CATEGORIES = '//div[@id="bottom1"]//ul//a/@href'
SELECTOR_GETTEXT_CATEGORIES = '//div[@id="bottom1"]//ul//li//a//span[@class="block link category-name"]//span/text()'
SELECTOR_GETLINK_ARTICLES = '//a[@class="marginright5 link linkWithHash detailsLink"]/@href'
SELECTOR_SITY = '//strong[@class="c2b small"]/text()'
SELECTOR_TITLE = '//h1[@class="brkword lheight28"]/text()'
SELECTOR_DATE = '//span[@class="pdingleft10 brlefte5"]/text()'


def services(request):
    return render(request, 'parsings/services.html', {})


def parser_olx(request):
    list_categories_text = ParserOLX('http://olx.ua').gettext(SELECTOR_GETTEXT_CATEGORIES)
    sity = FranshiseSity.objects.get(id=1)
    return render(request, 'parsings/parser_olx.html', {"list_categories_text": list_categories_text,
                                                        "sity": sity})


def parse(request):
    day_art = timezone.now() - datetime.timedelta(days=int(request.POST['id_term']))
    parse_categories = ParserOLX(SITE_URL).getlink(SELECTOR_GETLINK_CATEGORIES)[
        int(request.POST['id_categories'])]
    if request.POST['id_sity']:
        gs = goslate.Goslate()
        sity = FranshiseSity.objects.get(id=1)
        sity = gs.translate(sity.sity, 'en')
        parse_categories = ''.join([parse_categories, sity.lower(), '/'])
    dict_article = {}
    for i in xrange(1, 500):
        list_article = ParserOLX(''.join([parse_categories, '?page=', str(i)])).getlink(SELECTOR_GETLINK_ARTICLES)
        count_braek = 0
        for article in list_article:
            id_article = article.split('.')[-2].split('-')[-1]
            page_article = ParserOLX(article)
            date_article = ' '.join(page_article.gettext(SELECTOR_DATE)).encode('utf-8')
            p = re.compile(ur'(?P<time_art>\d{2}[:]\d{2})')
            time_art = re.search(p, date_article)
            time_art = time_art.group().split(':')
            p = re.compile(ur'(?P<date_art>\d{1,2}\s\W+\d{4})')
            date_art = re.search(p, date_article)
            date_art = date_art.group().split(' ')
            date_art.reverse()
            date_art[1] = mutable_month(date_art[1])
            datetime_art = datetime.datetime(int(date_art[0]), int(date_art[1]), int(date_art[2]),
                                             hour=int(time_art[0]), minute=int(time_art[1]))
            if datetime_art > day_art:
                phone = ParserOLX(SITE_URL + AJAX_PHONE + id_article[2:]).gettext()
                phone = ''.join(phone)
                try:
                    phone = json.loads(phone)
                    phone = mutable_phone(phone['value'])
                except:
                    phone = ['000000']
                if request.POST['id_except'] == '1' and not Makler.objects.filter(phone__in=[int(i) for i in phone]):
                    dict_article[id_article] = {
                        'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                        'title': page_article.gettext(SELECTOR_TITLE)[0].strip(),
                        'link': article,
                        'phone': phone}
                elif request.POST['id_except'] == '2' and not ContactOwner.objects.filter(
                        phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                        phone_owner_plus=[int(i) for i in phone]):
                    dict_article[id_article] = {
                        'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                        'title': page_article.gettext(SELECTOR_TITLE)[0].strip(), 'link': article, 'phone': phone}
                elif request.POST['id_except'] == '3' and not Makler.objects.filter(
                        phone__in=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                        phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                        phone_owner_plus=[int(i) for i in phone]):
                    dict_article[id_article] = {
                        'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                        'title': page_article.gettext(SELECTOR_TITLE)[0].strip(), 'link': article, 'phone': phone}
            else:
                count_braek += 1
        if count_braek > 10:
            break
    return HttpResponse(JsonResponse(dict_article))


def setting_olx(request):
    return render(request, 'parsings/setting_olx.html', {})


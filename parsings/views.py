# -*- coding: utf-8 -*-


import json

from django.core import serializers
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.generic import TemplateView
from django.views.generic import View

from parser_olx import Requester, mutable_phone, \
    valid_categories_list, ParserOlx
from makler.models import Makler
from facility.models import ContactOwner
from parsings.models import ConfigParserOLXSolo
from django.contrib.auth.decorators import login_required
from django.conf import settings

try:
    config_parser = ConfigParserOLXSolo.get_solo()


    SITE_URL = config_parser.SITE_URL
    AJAX_PHONE = config_parser.AJAX_PHONE
    SELECTOR_GETLINK_CATEGORIES = config_parser.SELECTOR_GETLINK_CATEGORIES
    SELECTOR_GETTEXT_CATEGORIES = config_parser.SELECTOR_GETTEXT_CATEGORIES
    # SELECTOR_GETTEXT_CATEGORIES = '//div[@id="bottom1"]//ul//li//a//span[@class="block link category-name"]//span/text()'
    SELECTOR_GETLINK_ARTICLES = config_parser.SELECTOR_GETLINK_ARTICLES
    # SELECTOR_GETLINK_ARTICLES = '//a[@class="marginright5 link linkWithHash detailsLink"]/@href'
    SELECTOR_SITY = config_parser.SELECTOR_SITY
    # SELECTOR_SITY = '//a[@class="show-map-link"]//strong/text()'
    SELECTOR_TITLE = config_parser.SELECTOR_TITLE
    # SELECTOR_TITLE = '//div[@class="offer-titlebox"]//h1/text()'
    SELECTOR_DATE = config_parser.SELECTOR_DATE
    # SELECTOR_DATE = '//div[@class="offer-titlebox__details"]//em/text()'
    SELECTOR_PRICE = config_parser.SELECTOR_PRICE
    # '//div[@class="price-label"]//strong/text()'
except:
    pass

@login_required
def services(request):
    if settings.ALLOWED_HOSTS[0] == 'dom6.usatba-krm.dn.ua':
        hi_dn_ua = True
    else:
        hi_dn_ua = False
    return render(request, 'parsings/services.html', {'hi_dn_ua': hi_dn_ua})


@login_required
def parser_olx(request):
    config_parser = ConfigParserOLXSolo.get_solo()
    dict_categories_text = {}

    try:
        list_categories_text = Requester(config_parser.SITE_URL).gettext(
            config_parser.SELECTOR_GETTEXT_CATEGORIES)
        for index, value in enumerate(list_categories_text):
            dict_categories_text[index] = value
    except:
        print('EXCEPT IN REQUESTER')

    city = ConfigParserOLXSolo.get_solo() or ''
    dict_categories_text = valid_categories_list(dict_categories_text)
    return render(request, 'parsings/parser_olx.html',
                  {"list_categories_text": dict_categories_text, "city": city})


@login_required
def parse(request):
    result, status = ParserOlx(request=request).start_parse()
    return HttpResponse(JsonResponse(result, safe=False), status=status)


def price_int(num):
    try:
        num = int(num)
        return num
    except:
        return None


class SettingOlxTemplateView(TemplateView):
    template_name = 'parsings/setting_olx.html'


class SettingOlx(View):
    def get(self, request):
        return HttpResponse(self.get_queryset())

    def post(self, request, *args, **kwargs):
        try:
            self.config_save(json.loads(request.body))
            return HttpResponse(status=200)
        except:
            return HttpResponse(status=404)

    def config_save(self, data):
        config = ConfigParserOLXSolo.objects.get()
        config.CITY=data.get('CITY')
        config.SITE_URL=data.get('SITE_URL')
        config.AJAX_PHONE=data.get('AJAX_PHONE')
        config.SELECTOR_GETLINK_CATEGORIES=data.get('SELECTOR_GETLINK_CATEGORIES')
        config.SELECTOR_GETTEXT_CATEGORIES=data.get('SELECTOR_GETTEXT_CATEGORIES')
        config.SELECTOR_GETLINK_ARTICLES=data.get('SELECTOR_GETLINK_ARTICLES')
        config.SELECTOR_SITY=data.get('SELECTOR_SITY')
        config.SELECTOR_TITLE=data.get('SELECTOR_TITLE')
        config.SELECTOR_DATE=data.get('SELECTOR_DATE')
        config.SELECTOR_PRICE=data.get('SELECTOR_PRICE')
        config.save()

    def get_queryset(self):
        return serializers.serialize("json", [ConfigParserOLXSolo.objects.get()])


@login_required
def parser_hi_dn_ua(request):
    return render(request, 'parsings/parser_hi_dn_ua.html', {})


@login_required
def parsehidnua(request):
    if request.method == 'POST':
        id_part = int(request.POST.get('id_part'))
        if id_part == 1:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=56'
        elif id_part == 2:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=9'
        elif id_part == 3:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=11'
        elif id_part == 4:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=12'
        elif id_part == 5:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=13'
        elif id_part == 6:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=19'
        elif id_part == 7:
            link = 'http://hi.dn.ua/index.php?option=com_sobi2&catid=55'
        pages = Requester(link).getlink('//ul[@class="pagination"]/li/strong/a//@href')
        site = Requester(link).gettext(selector='//td//text()')
        if int(request.POST['id_page']) > 1:
            site = Requester(pages[int(request.POST['id_page']) - 2]).gettext(selector='//td//text()')
        dict_article = {}
        for articles in site:
            if u'Тел.:' in articles or u'Тел. :' in articles:
                article = articles.split(u'Тел.:')[0]
                phone = articles.split(u'Тел.:')[-1][1:]
                try:
                    phone = ''.join(mutable_phone(phone))
                except:
                    phone = '000000'
                if request.POST['id_except'] == '1' and not Makler.objects.filter(phone__istartswith=phone):
                    dict_article[site.index(articles)] = {'phone': phone.encode('utf8'), 'article': article.encode('utf8')}
                elif request.POST['id_except'] == '2' and not ContactOwner.objects.filter(
                                    phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                                    phone_owner_plus=[int(i) for i in phone]):
                    dict_article[site.index(articles)] = {'phone': phone.encode('utf8'), 'article': article.encode('utf8')}
                elif request.POST['id_except'] == '3' and not Makler.objects.filter(
                                    phone__istartswith=phone) and not ContactOwner.objects.filter(
                                    phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                                    phone_owner_plus=[int(i) for i in phone]):
                    dict_article[site.index(articles)] = {'phone': phone.encode('utf8'), 'article': article.encode('utf8')}
    dict_article['id_page'] = int(request.POST['id_page']) + 1
    return HttpResponse(JsonResponse(dict_article))
    # return HttpResponse(content=b'ok')

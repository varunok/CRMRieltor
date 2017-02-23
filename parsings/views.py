# -*- coding: utf-8 -*-


import json
import re
import datetime
# from textblob import TextBlob
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder
from django.utils import timezone
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
# from setting_globall.models import FranshiseSity
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import TemplateView
from django.views.generic import View

from parser_olx import ParserOLX, mutable_month, mutable_phone, valid_categories_list
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
    try:
        list_categories_text = ParserOLX(config_parser.SITE_URL).gettext(config_parser.SELECTOR_GETTEXT_CATEGORIES)
        for cat in list_categories_text:
            dict_categories_text = dict(zip([list_categories_text.index(j) for j in list_categories_text], list_categories_text))
    except:
        dict_categories_text = ''
    try:
        sity = ConfigParserOLXSolo.objects.get()
    except:
        sity = ''
    dict_categories_text = valid_categories_list(dict_categories_text)
    return render(request, 'parsings/parser_olx.html', {"list_categories_text": dict_categories_text,
                                                        "sity": sity})



@login_required
def parse(request):
    # try:
        if request.method == 'POST':
            price_to_b = request.POST.get('price_to', None)
            price_for_b = request.POST.get('price_for', None)
            if request.POST['id_sity']:
                sity = ConfigParserOLXSolo.objects.get()
                sity = sity.CITY
                day_art = timezone.now() - datetime.timedelta(days=int(request.POST['id_term']))
                parse_categories = ParserOLX(SITE_URL).getlink(SELECTOR_GETLINK_CATEGORIES)[
                    int(request.POST['id_categories'])]
                if request.POST['id_sity']:
                        # sity = ConfigParserOLX.objects.get(id=1)
                        # sity = TextBlob(unicode(sity.SITY)).translate()
                        # sity = 'kiev'
                    parse_categories = ''.join([parse_categories, sity.lower(), '/'])
                dict_article = {}
                for page in xrange(int(request.POST['id_page']), int(request.POST['id_page']) + 1):
                    list_article = ParserOLX(''.join([parse_categories, '?page=', str(page)])).getlink(SELECTOR_GETLINK_ARTICLES)
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
                            price = page_article.gettext(SELECTOR_PRICE)
                            p = re.compile(ur'\d+')
                            price_i = p.findall(''.join(price))
                            if price_i:
                                price_i = price_int(''.join(price_i))
                            if isinstance(price_i, int):
                                if price_to_b:
                                    price_to = price_int(price_to_b)
                                    if isinstance(price_to, int):
                                        if price_i < price_to:
                                            continue
                                if price_for_b:
                                    price_for = price_int(price_for_b)
                                    if isinstance(price_for, int):
                                        if price_i > price_for:
                                            continue
                            phone = ParserOLX(SITE_URL + AJAX_PHONE + id_article[2:]).gettext()
                            phone = ''.join(phone)
                            try:
                                phone = json.loads(phone)
                                phone = mutable_phone(phone['value'])
                            except:
                                phone = ['000000']
                            if request.POST['id_except'] == '1' and not Makler.objects.filter(phone__in=phone):
                                dict_article[id_article] = {
                                    'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                                    'title': page_article.gettext(SELECTOR_TITLE)[0].strip(),
                                    'link': article,
                                    'phone': phone,
                                    'price': price
                                    }
                            elif request.POST['id_except'] == '2' and not ContactOwner.objects.filter(
                                    phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                                    phone_owner_plus=[int(i) for i in phone]):
                                dict_article[id_article] = {
                                    'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                                    'title': page_article.gettext(SELECTOR_TITLE)[0].strip(),
                                    'link': article,
                                    'price': price,
                                    'phone': phone
                                }
                            elif request.POST['id_except'] == '3' and not Makler.objects.filter(
                                    phone__in=phone) and not ContactOwner.objects.filter(
                                    phone_owner=[int(i) for i in phone]) and not ContactOwner.objects.filter(
                                    phone_owner_plus=[int(i) for i in phone]):
                                dict_article[id_article] = {
                                    'sity': page_article.gettext(SELECTOR_SITY)[0].split(',')[0].split(' ')[-1],
                                    'title': page_article.gettext(SELECTOR_TITLE)[0].strip(),
                                    'link': article,
                                    'phone': phone,
                                    'price': price
                                }
                        else:
                            count_braek += 1
                    if count_braek > 10:
                        break
                dict_article['id_page'] = page + 1
                return HttpResponse(JsonResponse(dict_article))
        else:
            return HttpResponse(status=503)
    # except:
    #     return HttpResponse(status=503)


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
        pages = ParserOLX(link).getlink('//ul[@class="pagination"]/li/strong/a//@href')
        site = ParserOLX(link).gettext(selector='//td//text()')
        if int(request.POST['id_page']) > 1:
            site = ParserOLX(pages[int(request.POST['id_page'])-2]).gettext(selector='//td//text()')
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

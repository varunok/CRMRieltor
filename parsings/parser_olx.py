# -*- coding: utf-8 -*-

import json
import requests
from requests import cookies
from lxml import html
import re
import datetime
from urlparse import urljoin
import os

from django.utils import timezone

from facility.models import ContactOwner
from makler.models import Makler
from parsings.models import ConfigParserOLXSolo


class ConfigParserOlx(object):
    """
    SELECTOR_GETTEXT_CATEGORIES = '//div[@id="bottom1"]//ul//li//a//span[@class="block link category-name"]//span/text()'
    SELECTOR_GETLINK_ARTICLES = '//a[@class="marginright5 link linkWithHash detailsLink"]/@href'
    SELECTOR_SITY = '//a[@class="show-map-link"]//strong/text()'
    SELECTOR_TITLE = '//div[@class="offer-titlebox"]//h1/text()'
    SELECTOR_DATE = '//div[@class="offer-titlebox__details"]//em/text()'
    '//div[@class="price-label"]//strong/text()'
    """
    try:
        config_parser = ConfigParserOLXSolo.get_solo()
        SITE_URL = config_parser.SITE_URL
        AJAX_PHONE = config_parser.AJAX_PHONE
        SELECTOR_GETLINK_CATEGORIES = config_parser.SELECTOR_GETLINK_CATEGORIES
        SELECTOR_GETTEXT_CATEGORIES = config_parser.SELECTOR_GETTEXT_CATEGORIES
        SELECTOR_GETLINK_ARTICLES = config_parser.SELECTOR_GETLINK_ARTICLES
        SELECTOR_SITY = config_parser.SELECTOR_SITY
        SELECTOR_TITLE = config_parser.SELECTOR_TITLE
        SELECTOR_DATE = config_parser.SELECTOR_DATE
        SELECTOR_PRICE = config_parser.SELECTOR_PRICE
    except:
        pass


class Requester(object):

    def __init__(self, link, ssid=None, verify=True):
        self.link = link

        self.response = requests.get(self.link,
                                     cookies=self._get_cookies(ssid),
                                     verify=verify)
        try:
            self.PHPSESSID = self.response.cookies['PHPSESSID']
        except KeyError:
            pass
        self.parsed_body = html.fromstring(self.response.text)

    def getlink(self, selector):
        list_link = self.parsed_body.xpath(selector)
        list_link = \
            [urljoin(self.response.url, url)for url in list_link]
        return list_link

    def gettext(self, selector='//text()'):
        return self.parsed_body.xpath(selector)

    def _get_cookies(self, ssid):
        jar = requests.cookies.RequestsCookieJar()
        jar.set('PHPSESSID', ssid, domain=self._get_cookies_domain(), path='/')
        return jar

    @staticmethod
    def _get_cookies_domain():
        config = ConfigParserOlx()
        domain = config.SITE_URL.strip('//')[-1]
        return ''.join(('.', domain))


class ParserOlx(ConfigParserOlx):
    status = 200

    def __init__(self, request):
        self.request = request
        self.dict_article = {}

    @property
    def result(self):
        return self.dict_article, self.status

    def start_parse(self):
        self._parse_request()
        if not self._validate_request():
            return self.result
        else:
            self._run()
            self.dict_article['id_page'] = int(self.page) + 1
            return self.result

    def _run(self):
        for article in self._get_list_article():

            id_article = article.split('.')[-2].split('-')[-1]

            page_article = Requester(article)

            if self._filter_daily(page_article):
                continue

            datetime_article = self._get_date_article(page_article)
            if isinstance(datetime_article, datetime.datetime) and \
                    datetime_article > self.day_art:

                price, price_i = self._get_price(page_article)
                if isinstance(price_i, int):
                    if isinstance(self.price_to, int):
                        if price_i < self.price_to:
                            continue
                    if isinstance(self.price_for, int):
                        if price_i > self.price_for:
                            continue

                phones = self._get_phone(page_article, id_article)

                city = page_article.gettext(self.SELECTOR_SITY)[0]\
                    .split(',')[0].split(' ')[-1]

                title = page_article.gettext(self.SELECTOR_TITLE)[0].strip()

                if self.id_except == '1' and not Makler.objects.filter(
                        phone__in=phones).exists():
                    self.set_data(id_article, city, title, article, phones,
                                  price)

                elif self.id_except == '2' and not ContactOwner.objects.filter(
                        phone_owner__in=phones,
                        phone_owner_plus__in=phones).exists():
                    self.set_data(id_article, city, title, article, phones,
                                  price)

                elif self.id_except == '3'\
                    and not Makler.objects.filter(phone__in=phones).exists() \
                    and not ContactOwner.objects.filter(
                            phone_owner__in=phones,
                            phone_owner_plus__in=phones).exists():
                    self.set_data(id_article, city, title, article, phones,
                                  price)

    def set_data(self, id_article, city, title, article, phones, price):
        self.dict_article[id_article] = {
            'sity': city,
            'title': title,
            'link': article,
            'phone': phones,
            'price': price
        }

    def _filter_daily(self, article):
        links = article.gettext(
            '//table[@class="details fixed '
            'marginbott20 margintop5 full"]//@href'
        )
        for link in links:
            if 'kvartiry-posutochno' in link:
                return True
        return False

    def _validate_request(self):
        if self.id_categories < 0 or not self.city:
            self.status = 404
            return False
        return True

    def _parse_request(self):
        self.id_categories = int(self.request.POST.get('id_categories', -1))
        self.id_except = self.request.POST.get('id_except')
        self.id_term = int(self.request.POST.get('id_term'))
        self.city = self.request.POST.get('id_sity')
        self.price_to = self.request.POST.get('price_to')
        if self.price_to:
            self.price_to = int(self.price_to)
        self.price_for = self.request.POST.get('price_for')
        if self.price_for:
            self.price_for = int(self.price_for)
        self.page = str(self.request.POST.get('id_page'))

    def _get_list_article(self):
        return Requester(
            ''.join([self._get_categories, '?page=', self.page])).getlink(
            self.SELECTOR_GETLINK_ARTICLES)

    @property
    def _get_categories(self):
        parse_categories = Requester(self.SITE_URL).getlink(
            self.SELECTOR_GETLINK_CATEGORIES)[self.id_categories]
        return ''.join([parse_categories, self.city.lower(), '/'])

    def _get_date_article(self, page_article):
        try:
            date_article = ' '.join(page_article.gettext(self.SELECTOR_DATE)) \
                .encode('utf-8')
            p = re.compile(ur'(?P<time_art>\d{2}[:]\d{2})')
            time_art = re.search(p, date_article)
            time_art = time_art.group().split(':')
            p = re.compile(ur'(?P<date_art>\d{1,2}\s\W+\d{4})')
            date_art = re.search(p, date_article)
            date_art = date_art.group().split(' ')
            date_art.reverse()
            date_art[1] = mutable_month(date_art[1])
            datetime_article = datetime.datetime(
                int(date_art[0]),
                int(date_art[1]),
                int(date_art[2]),
                hour=int(time_art[0]),
                minute=int(time_art[1]))
            return datetime_article
        except AttributeError:
            return None

    @property
    def day_art(self):
        return timezone.now() - datetime.timedelta(days=self.id_term)

    def _get_price(self, page_article):
        price = page_article.gettext(self.SELECTOR_PRICE)
        p = re.compile(ur'\d+')
        price_i = p.findall(''.join(price))
        if price_i:
            price_i = int(''.join(price_i))
            return price[0], price_i
        return '', ''

    def _get_phone(self, page_article, id_article):
        phone_token = self._get_phone_token(page_article)
        if not phone_token:
            return None

        path = ''.join((self.SITE_URL, self.AJAX_PHONE,
                        id_article[2:], '/?pt=', phone_token))

        if hasattr(page_article, 'PHPSESSID'):
            phone = Requester(path, ssid=page_article.PHPSESSID).gettext()
            phone = ''.join(phone)
            try:
                phone = json.loads(phone)
                return mutable_phone(phone['value'])
            except ValueError:
                return []

    def _get_phone_token(self, page_article):
        page_article = page_article.gettext(
            '//script[contains(., "phoneToken")]/text()')
        if page_article:
            page_article = [x for x in page_article[0].split('\'')
                            if '\n' not in x]
            if page_article:
                return page_article[0]
        return False


def mutable_phone(phone):
    p = re.compile(ur'\d{7,10}')
    phone = phone.replace('-', '')
    phone = phone.replace('(', '')
    phone = phone.replace(')', '')
    phone = phone.replace('+38', '')
    phone = phone.replace('+8', '')
    phone = phone.replace(' ', '')
    if len(phone) == 12:
        if phone[0:3] == '380':
            phone = phone[2:]
    phone = re.findall(p, phone)
    return phone


def mutable_month(month):
    try:
        month = month.lower()
        if month == 'января':
            month = '01'
        elif month == 'февраля':
            month = '02'
        elif month == 'марта':
            month = '03'
        elif month == 'апреля':
            month = '04'
        elif month == 'мая':
            month = '05'
        elif month == 'июня':
            month = '06'
        elif month == 'июля':
            month = '07'
        elif month == 'августа':
            month = '08'
        elif month == 'сентября':
            month = '09'
        elif month == 'октября':
            month = '10'
        elif month == 'ноября':
            month = '11'
        elif month == 'декабря':
            month = '12'
        else:
            month = '01'
        return month
    except:
        return '01'


def get_list_translate_sity(sity):
    try:
        request_sity = ''
        with open(''.join([os.getcwd(), '/media/cities5000.txt']), 'r') as f:
                for i in f:
                    if sity in i:
                        i = i.replace('\t', ',').split(',')
                        i = [g for g in i if g != '' and '.' not in g and '/' not in g and '-' not in g and ' ' not in g and len(g) > 3][1:-1]
                        for j in i:
                            if sity == j:
                                if len(i) > len(request_sity):
                                    request_sity = i
        if len(request_sity) >= 1:
            return request_sity
        else:
            return None
    except:
        return None


def valid_categories_list(list_categories_text):
    list_categories_text_copy = list_categories_text.copy()
    blacklist = [u'Аренда гаражей / стоянок', u'Ищу компаньона', u'Продажа гаражей / стоянок', u'Аренда помещений',
                 u'Продажа помещений', u'Обмен недвижимости', u'Прочая недвижимость']
    for cat in list_categories_text_copy:
        if list_categories_text[cat] in blacklist:
            del list_categories_text[cat]
    return list_categories_text

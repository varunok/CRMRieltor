# -*- coding: utf-8 -*-


import requests
from lxml import html
import re
from urlparse import urlparse, urljoin


class ParserOLX(object):
    def __init__(self, link):
        self.link = link
        self.response = requests.get(self.link)
        self.parsed_body = html.fromstring(self.response.text)

    def getlink(self, selector):
        self.list_link = self.parsed_body.xpath(selector)
        self.list_link = [urljoin(self.response.url, url)for url in self.list_link]
        str(self.list_link)
        return self.list_link

    def gettext(self, selector='//text()'):
        self.text = self.parsed_body.xpath(selector)
        return self.text


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


# -*- coding: utf-8 -*-


import requests
from lxml import html
from urlparse import urlparse, urljoin


class ParserOLX(object):
    def __init__(self, link):
        self.link = link
        self.response = requests.get(self.link)
        self.parsed_body = html.fromstring(self.response.text)

    def getlink(self):
        self.list_link = self.parsed_body.xpath('//div[@id="bottom1"]//ul//a/@href')
        self.list_link = [urljoin(self.response.url, url)for url in self.list_link]
        str(self.list_link)
        return self.list_link

    def gettext(self):
        self.text = self.parsed_body.xpath('//div[@id="bottom1"]//ul//li//a//span[@class="block link category-name"]//span/text()')
        return self.text



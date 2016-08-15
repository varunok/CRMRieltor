# -*- coding: utf-8 -*-


from grab import Grab



def parsing():
    g = Grab()
    g.go('http://olx.ua/')
    # return g.xpath_list('//a[@class="link parent"]').get('href')
    ff = g.doc.select('//div[@class="maincategories"]//div[@class="maincategories-list clr"]//a').node_list()
    for i in ff:
        print i.get('href')
        print i.get('//span')
    return  g.doc.select('//a').node_list()
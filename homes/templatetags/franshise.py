# -*- coding: utf-8 -*-


from django import template
from setting_globall.models import Franshise


register = template.Library()


@register.simple_tag(name='franshise_first')
def franshise_first():
    try:
        franshise = Franshise.objects.get(id=1)
        franshise =  franshise.franshise.split('.')[0]
        return franshise
    except:
        return ''

@register.simple_tag(name='franshise_second')
def franshise_second():
    try:
        franshise = Franshise.objects.get(id=1)
        franshise =  franshise.franshise.split('.')[1:]
        franshise = '.'.join(franshise)
        return franshise
    except:
        return ''


@register.simple_tag(name='franshise_len')
def franshise_len():
    try:
        franshise = Franshise.objects.get(id=1)
        franshise =  franshise.franshise.split('.')[0]
        return len(franshise)
    except:
        return ''
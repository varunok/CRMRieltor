# -*- coding: utf-8 -*-


from django import template
from django.utils import timezone

register = template.Library()


@register.filter(name='dead_line')
def dead_line(date_arg):
    date_new = date_arg - timezone.now()
    date_new = str(date_new).split(',')

    if len(date_new)==1:
        return True
    elif len(date_new)>1:
        date_new = int(date_new[0].split(' ')[0])
        if date_new < 0:
            return True
    else:
        return False

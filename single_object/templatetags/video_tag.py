# -*- coding: utf-8 -*-


from django import template

register = template.Library()


@register.filter(name='youtube_code')
def youtube_code(code):
    iframe = '<iframe width="560" height="315" src="https://www.youtube.com/embed/%s" frameborder="0" allowfullscreen></iframe>'
    code = code.split('/')[-1]
    code = iframe % code
    if code:
        return code
    else:
        return ''


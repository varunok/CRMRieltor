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


@register.filter(name='panorama_code')
def panorama_code(code):
    panorama = '<iframe %s width="490" height="335" frameborder="0" style="border:0" allowfullscreen=""></iframe>'
    codes = code.split(' ')
    for src in codes:
        if 'src' in src:
            src = panorama % src
            return src
    return ''


@register.filter(name='convert_frame')
def convert_frame(code):
    youtube = 'http://youtu.be/%s'
    if 'iframe' in code:
        codes = code.split(' ')
        for code in codes:
            if 'src' in code:
                code = code.split('/')[-1][0:-2]
                return youtube % code
    else:
        return code
# -*- coding: utf-8 -*-


from django.conf.urls import url
from parsings.views import services, parser_olx, parse, parser_hi_dn_ua, \
    parsehidnua, SettingOlxTemplateView, SettingOlx

urlpatterns = [
    url(r'services$', services, name='services'),
    url(r'parser_olx$', parser_olx, name='parser_olx'),
    url(r'parser_hi_dn_ua$', parser_hi_dn_ua, name='parser_hi_dn_ua'),
    url(r'parse$', parse),
    url(r'parsehidnua$', parsehidnua),
    url(r'setting_olx$', SettingOlxTemplateView.as_view(), name='setting_olx'),
    url(r'get-setting-json$', SettingOlx.as_view()),
    url(r'save-parser-config$', SettingOlx.as_view()),
]

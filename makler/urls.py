# -*- coding: utf-8 -*-


from django.conf.urls import url
from makler.views import add_makler, form_makler, edit_makler, save_edit_makler, MaklerListWhite, MaklerListBlack, send_email_makler


urlpatterns = [
    url(r'add_makler$', add_makler, name='add_makler'),
    url(r'form_makler$', form_makler, name='form_makler'),
    url(r'edit_makler$', edit_makler, name='edit_makler'),
    url(r'^maklers_white$', MaklerListWhite.as_view(), name='maklers_white'),
    url(r'^maklers_black$', MaklerListBlack.as_view(), name='maklers_black'),
    url(r'save_edit_makler/(?P<id>[0-9]+)$', save_edit_makler, name='save_edit_makler'),
    url(r'send_email_makler$', send_email_makler, name='send_email_makler'),
]
# -*- coding: utf-8 -*-


from django.conf.urls import url
from single_arendator.views import SingleArendatorView, add_single_arendator_comment, get_comment_arendator, \
    del_comment, get_object_arendator, automat_tie_arendator, add_id_cont_owner, clear_cont_owner, \
    del_cont_owner, change_show_owner


urlpatterns = [
    url(r'^(?P<aid>[0-9]+)$', SingleArendatorView.as_view(), name='single_arendator'),

    # block comment
    url(r'^get_comment_arendator$', get_comment_arendator, name='get_comment_arendator'),
    url(r'^add_single_arendator_comment$', add_single_arendator_comment, name='add_single_arendator_comment'),
    url(r'^del_comment$', del_comment, name='del_comment'),
    # end block comment

    # block pick up an object
    url(r'^get_object_arendator$', get_object_arendator, name='get_object_arendator'),
    url(r'^automat_tie_arendator$', automat_tie_arendator, name='automat_tie_arendator'),
    url(r'^add_id_cont_owner$', add_id_cont_owner, name='add_id_cont_owner'),
    url(r'^clear_cont_owner$', clear_cont_owner, name='clear_cont_owner'),
    url(r'^del_cont_owner$', del_cont_owner, name='del_cont_owner'),
    url(r'^change_show_owner$', change_show_owner, name='change_show_owner'),
    # end block pick up an object
]
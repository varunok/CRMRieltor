# -*- coding: utf-8 -*-


from django.conf.urls import url
from homes import views

urlpatterns = [
    # site pages menu
    url(r'^$', views.homes, name='homes'),
    url(r'^objects$', views.object_list, name='objects'),
    url(r'^buyers$', views.buyers_list, name='buyers'),
    url(r'^maklers$', views.maklers_list, name='maklers'),
    url(r'^arendators$', views.arendators_list, name='arendators'),
    url(r'^buyers/add_buyer$', views.add_buyer, name='add_buyer'),
    url(r'^arendators/add_arendator$', views.add_arendator, name='add_arendator'),
    url(r'^objects/add_object$', views.add_object, name='add_object'),
    url(r'^tasking$', views.tasking, name='tasking'),
    url(r'^setting$', views.setting, name='setting'),
    url(r'^meeting$', views.meeting, name='meeting'),
    # end site
]

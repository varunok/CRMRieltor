# -*- coding: utf-8 -*-


from django.conf.urls import url
from homes import views
from homes.views import ObjectList, ObjectListSearch, ObjectListSelling, ObjectListArend, ArendatorsList

urlpatterns = [
    # site pages menu
    url(r'^$', views.homes, name='homes'),
    url(r'^objects/$', ObjectList.as_view(), name='objects'),
    url(r'^[a-zA-Z]+/search_obj/$', ObjectListSearch.as_view(), name='objects_search'),
    url(r'^selling/$', ObjectListSelling.as_view(), name='selling'),
    url(r'^arend/$', ObjectListArend.as_view(), name='arend'),
    url(r'^buyers$', views.buyers_list, name='buyers'),
    url(r'^maklers$', views.maklers_list, name='maklers'),
    url(r'^arendators$', ArendatorsList.as_view(), name='arendators'),
    url(r'^buyers/add_buyer$', views.add_buyer, name='add_buyer'),
    url(r'^arendators/add_arendator$', views.add_arendator, name='add_arendator'),
    url(r'^objects/add_object$', views.add_object, name='add_object'),
    url(r'^tasking$', views.tasking, name='tasking'),
    url(r'^setting$', views.setting, name='setting'),
    url(r'^meeting$', views.meeting, name='meeting'),
    # end site
]

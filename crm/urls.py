# -*- coding: utf-8 -*-


"""crm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from homes import views
from notes.views import note_add, note_del, note_edit

urlpatterns = [
    # site
    url(r'^$', views.views, name='homes'),
    url(r'^object$', views.object, name='object'),
    url(r'^buyers$', views.buyers, name='buyers'),
    # end site

    # admin
    url(r'^admin/', admin.site.urls),
    # endadmin

    # request notes
    url(r'^note_add$', note_add),
    url(r'^note_del$', note_del),
    url(r'^note_edit$', note_edit),
    # end request notes

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

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
from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
import setting_street.urls
import extuser.urls
import homes.urls
import notes.urls
import facility.urls
import setting_globall.urls

urlpatterns = [
    url(r'^', include(setting_street.urls)),
    url(r'^', include(extuser.urls)),
    url(r'^', include(homes.urls)),
    url(r'^', include(notes.urls)),
    url(r'^', include(facility.urls)),
    url(r'^', include(setting_globall.urls)),
    # admin
    url(r'^admin/', admin.site.urls),
    # end admin
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()

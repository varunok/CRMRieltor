from django.contrib import admin
from parsings.models import ConfigParserOLXSolo
from solo.admin import SingletonModelAdmin
# Register your models here.

admin.site.register(ConfigParserOLXSolo, SingletonModelAdmin)

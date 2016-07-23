# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0027_auto_20160713_0039'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='floors_up',
            field=models.IntegerField(null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u0434\u043e', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='number_of_floors',
            field=models.IntegerField(null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u043e\u0442', blank=True),
        ),
    ]

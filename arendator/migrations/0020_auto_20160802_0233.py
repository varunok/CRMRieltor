# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0019_auto_20160802_0053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='typeclient',
            name='client',
            field=models.CharField(max_length=150, null=True, verbose_name='\u0422\u0438\u043f \u043a\u043b\u0438\u0435\u043d\u0442\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='typestage',
            name='stage',
            field=models.CharField(max_length=150, null=True, verbose_name='\u0422\u0438\u043f \u042d\u0442\u0430\u043f\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='typestate',
            name='state',
            field=models.CharField(max_length=150, null=True, verbose_name='\u0421\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0435', blank=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_superadmin', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alltocall',
            name='email',
            field=models.EmailField(max_length=254, null=True, verbose_name='Email', blank=True),
        ),
        migrations.AlterField(
            model_name='alltocall',
            name='group_vk',
            field=models.CharField(max_length=200, null=True, verbose_name='\u0413\u0440\u0443\u043f\u0430 \u0412\u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0435', blank=True),
        ),
        migrations.AlterField(
            model_name='alltocall',
            name='phone',
            field=models.IntegerField(null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
        migrations.AlterField(
            model_name='alltocall',
            name='skype',
            field=models.CharField(max_length=100, null=True, verbose_name='Skype', blank=True),
        ),
    ]

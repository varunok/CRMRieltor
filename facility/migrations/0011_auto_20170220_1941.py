# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0010_auto_20161001_1755'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='name_owner_ext',
            field=models.CharField(max_length=250, verbose_name='\u0418\u043c\u044f \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430 \u0434\u043e\u043f.', blank=True),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='name_owner_ext2',
            field=models.CharField(max_length=250, verbose_name='\u0418\u043c\u044f \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430 \u0434\u043e\u043f.2', blank=True),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='phone_owner_plus2',
            field=models.CharField(max_length=16, null=True, verbose_name='\u0414\u043e\u043f\u043e\u043b. \u0422\u0435\u043b\u0435\u0444\u043e\u043d-2', blank=True),
        ),
    ]

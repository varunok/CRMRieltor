# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0012_auto_20160725_1744'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='rooms_from',
            field=models.IntegerField(null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442 \u041e\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='rooms_to',
            field=models.IntegerField(null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442 \u0414\u043e', blank=True),
        ),
    ]

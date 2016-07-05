# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0013_auto_20160703_0611'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='agency',
            field=models.CharField(max_length=250, verbose_name='\u0410\u0433\u0435\u043d\u0441\u0442\u0432\u043e', blank=True),
        ),
    ]

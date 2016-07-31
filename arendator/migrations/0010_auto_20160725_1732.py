# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_street', '0001_initial'),
        ('arendator', '0009_auto_20160725_1730'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='arendator',
            name='district_obj',
        ),
        migrations.AddField(
            model_name='arendator',
            name='district_obj',
            field=models.ManyToManyField(to='setting_street.District', null=True, verbose_name='\u0420\u0430\u0439\u043e\u043d', blank=True),
        ),
    ]

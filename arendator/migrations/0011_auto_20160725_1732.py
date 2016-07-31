# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0010_auto_20160725_1732'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='district_obj',
            field=models.ManyToManyField(to='setting_street.District', verbose_name='\u0420\u0430\u0439\u043e\u043d', blank=True),
        ),
    ]

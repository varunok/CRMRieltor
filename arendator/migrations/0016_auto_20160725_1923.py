# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0015_auto_20160725_1858'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='district_obj',
            field=models.ManyToManyField(related_name='districts', verbose_name='\u0420\u0430\u0439\u043e\u043d', to='setting_street.District', blank=True),
        ),
    ]

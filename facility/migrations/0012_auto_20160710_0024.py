# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0011_imagesfacility_cover'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='panorama',
            field=models.CharField(max_length=250, null=True, verbose_name='\u041f\u0430\u043d\u043e\u0440\u0430\u043c\u0430', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='title',
            field=models.CharField(max_length=250, null=True, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='youtube',
            field=models.CharField(max_length=250, null=True, verbose_name='YouTube', blank=True),
        ),
    ]

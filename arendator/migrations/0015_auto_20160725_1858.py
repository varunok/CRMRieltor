# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160725_0144'),
        ('arendator', '0014_auto_20160725_1858'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='number_of_persons',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0447\u0435\u043b\u043e\u0432\u0435\u043a', blank=True, to='facility.TypeNumberOfPerson', null=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='type_stage',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u042d\u0442\u0430\u043f', blank=True, to='arendator.TypeStage', null=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0006_auto_20160703_0401'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeOperations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_operations', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0439',
            },
        ),
    ]

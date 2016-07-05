# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0033_databasephoneowner'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeBuilding',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_building', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u044f')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u044f',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u0439',
            },
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_globall', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='FranshiseSity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sity', models.CharField(max_length=100, verbose_name='\u0413\u043e\u0440\u043e\u0434')),
            ],
            options={
                'verbose_name': '\u0413\u043e\u0440\u043e\u0434 \u0444\u0440\u0430\u043d\u0448\u0438\u0437\u0438',
            },
        ),
    ]

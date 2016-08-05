# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AllToCall',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('phone', models.IntegerField(verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('email', models.EmailField(max_length=254, verbose_name='Email')),
                ('skype', models.CharField(max_length=100, verbose_name='Skype')),
                ('group_vk', models.CharField(max_length=200, verbose_name='\u0413\u0440\u0443\u043f\u0430 \u0412\u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0435')),
            ],
            options={
                'verbose_name': '\u0412\u0441\u0435\u0433\u0434\u0430 \u043d\u0430 \u0441\u0432\u044f\u0437\u0438',
            },
        ),
    ]

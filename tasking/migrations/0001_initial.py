# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.auth.models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeComplexity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('complexity', models.CharField(max_length=20, null=True, verbose_name='\u0422\u0438\u043f \u0441\u043b\u043e\u0436\u043d\u043e\u0441\u0442\u0438', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0441\u043b\u043e\u0436\u043d\u043e\u0441\u0442\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u0438 \u0441\u043b\u043e\u0436\u043d\u043e\u0441\u0442\u0438',
            },
        ),
        migrations.CreateModel(
            name='UserFullName',
            fields=[
            ],
            options={
                'proxy': True,
            },
            bases=('auth.user',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]

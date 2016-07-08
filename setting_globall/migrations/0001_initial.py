# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='NationalCarrency',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('currency', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043d\u0430\u0446\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u043e\u0439 \u0432\u0430\u043b\u044e\u0442\u044b',
                'verbose_name_plural': '\u0422\u0438\u043f \u043d\u0430\u0446\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u043e\u0439 \u0432\u0430\u043b\u044e\u0442\u044b',
            },
        ),
    ]

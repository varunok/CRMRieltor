# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_globall', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ListNationalCarrency',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('currency_glob', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name': '\u0421\u043f\u0438\u0441\u043e\u043a \u043d\u0430\u0446\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u043e\u0439 \u0432\u0430\u043b\u044e\u0442\u044b',
                'verbose_name_plural': '\u0421\u043f\u0438\u0441\u043a\u0438 \u043d\u0430\u0446\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u043e\u0439 \u0432\u0430\u043b\u044e\u0442\u044b',
            },
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('makler', '0004_auto_20160803_0347'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeWhiteBlack',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_white_black', models.CharField(max_length=50, verbose_name='\u0422\u0438\u043f \u043c\u0430\u043a\u043b\u0435\u0440\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043c\u0430\u043a\u043b\u0435\u0440\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u0438 \u043c\u0430\u043a\u043b\u0435\u0440\u043e\u0432',
            },
        ),
    ]

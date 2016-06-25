# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TypesStreet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_street', models.CharField(max_length=30, verbose_name='\u0422\u0438\u043f \u0443\u043b\u0438\u0446\u044b')),
                ('short_name', models.CharField(max_length=30, verbose_name='\u041a\u043e\u0440\u043e\u0442\u043a\u043e\u0435 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0443\u043b\u0438\u0446\u044b',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0443\u043b\u0438\u0446',
            },
        ),
    ]

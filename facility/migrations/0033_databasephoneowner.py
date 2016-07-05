# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0032_auto_20160704_1803'),
    ]

    operations = [
        migrations.CreateModel(
            name='DatabasePhoneOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('db_id_owner', models.CharField(max_length=16, null=True, verbose_name='ID', blank=True)),
                ('db_phone_owner', models.CharField(max_length=16, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432',
            },
        ),
    ]

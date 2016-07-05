# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0020_contactowner_vip_owner'),
    ]

    operations = [
        migrations.CreateModel(
            name='PhoneOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('phone', models.IntegerField(verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('phone_plus', models.IntegerField(verbose_name='\u0414\u043e\u043f. \u0442\u0435\u043b\u0435\u0444\u043e\u043d')),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
            },
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='vip_owner',
            field=models.BooleanField(default=1, verbose_name=b'Vip'),
            preserve_default=False,
        ),
    ]
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0009_auto_20160703_0429'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeContactOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_contact_owner', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u043e\u0432 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
            },
        ),
    ]

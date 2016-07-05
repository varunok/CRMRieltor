# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0029_auto_20160704_1755'),
    ]

    operations = [
        migrations.CreateModel(
            name='PhoneOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('phone', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.ContactOwner', null=True)),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432',
            },
        ),
    ]

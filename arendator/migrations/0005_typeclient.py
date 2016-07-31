# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0004_auto_20160725_0307'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeClient',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('client', models.CharField(max_length=150, null=True, verbose_name=b'\xd0\xa2\xd0\xb8\xd0\xbf \xd0\xba\xd0\xbb\xd0\xb8\xd0\xb5\xd0\xbd\xd1\x82\xd0\xb0', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043a\u043b\u0438\u0435\u043d\u0442\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u0438 \u043a\u043b\u0438\u0435\u043d\u0442\u043e\u0432',
            },
        ),
    ]

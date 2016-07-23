# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0028_auto_20160714_1156'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeRooms',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_rooms', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041a\u043e\u043c\u043d\u0430\u0442\u044b')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041a\u043e\u043c\u043d\u0430\u0442\u044b',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041a\u043e\u043c\u043d\u0430\u0442',
            },
        ),
    ]

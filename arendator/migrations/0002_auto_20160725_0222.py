# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeState',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('state', models.CharField(max_length=150, null=True, verbose_name=b'\xd0\xa1\xd0\xbe\xd1\x81\xd1\x82\xd0\xbe\xd1\x8f\xd0\xbd\xd0\xb8\xd0\xb5', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0441\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u044f',
                'verbose_name_plural': '\u0422\u0438\u043f\u0438 \u0441\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0439',
            },
        ),
        migrations.AddField(
            model_name='arendator',
            name='commission',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041a\u043e\u043c\u0438\u0441\u0441\u0438\u044f', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='name',
            field=models.CharField(max_length=250, verbose_name='\u0418\u043c\u044f', blank=True),
        ),
    ]

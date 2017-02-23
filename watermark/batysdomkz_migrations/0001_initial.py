# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Watermark',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.CharField(max_length=50, null=True, verbose_name='\u0412\u043e\u0434\u044f\u043d\u043e\u0439 \u0437\u043d\u0430\u043a', blank=True)),
                ('watermark_img', models.ImageField(upload_to=b'watermark', verbose_name='\u0412\u043e\u0434\u044f\u043d\u043e\u0439 \u0437\u043d\u0430\u043a')),
                ('on_off', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': '\u0412\u043e\u0434\u044f\u043d\u043e\u0439 \u0437\u043d\u0430\u043a',
                'verbose_name_plural': '\u0412\u043e\u0434\u044f\u043d\u043e\u0439 \u0437\u043d\u0430\u043a',
            },
        ),
    ]

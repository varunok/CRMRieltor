# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_globall', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subscribe',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name='\u041f\u043e\u0434\u043f\u0438\u0441\u044c')),
                ('phone', models.CharField(max_length=50, verbose_name='\u041f\u043e\u0434\u043f\u0438\u0441\u044c')),
            ],
            options={
                'verbose_name': '\u041f\u043e\u0434\u043f\u0438\u0441\u044c',
                'verbose_name_plural': '\u041f\u043e\u0434\u043f\u0438\u0441\u044c',
            },
        ),
    ]

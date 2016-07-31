# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.auth.models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='Arendator',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
            options={
                'verbose_name': '\u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440',
                'verbose_name_plural': '\u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0438',
            },
        ),
        migrations.CreateModel(
            name='UserFullName',
            fields=[
            ],
            options={
                'proxy': True,
            },
            bases=('auth.user',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.AddField(
            model_name='arendator',
            name='loyality',
            field=models.ManyToManyField(related_name='loyal', verbose_name='\u041b\u043e\u044f\u043b\u044c\u043d\u043e\u0441\u0442\u044c', to='arendator.UserFullName', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='rieltor',
            field=models.ManyToManyField(to='arendator.UserFullName', verbose_name='\u0420\u0438\u0435\u043b\u0442\u043e\u0440', blank=True),
        ),
    ]

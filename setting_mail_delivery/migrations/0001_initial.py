# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TemplateEmail',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=250, null=True, verbose_name='\u0422\u0435\u043c\u0430', blank=True)),
                ('logo', models.ImageField(upload_to=b'temp_email_logo', verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f')),
                ('text', models.TextField(null=True, verbose_name='\u0422\u0435\u043a\u0441\u0442', blank=True)),
                ('sender_address', models.EmailField(max_length=150, null=True, verbose_name='E-mail \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True)),
                ('signature', models.CharField(max_length=250, null=True, verbose_name='\u041f\u043e\u0434\u043f\u0438\u0441\u044c', blank=True)),
            ],
            options={
                'verbose_name': '\u0428\u0430\u0431\u043b\u043e\u043d Email \u0440\u0430\u0441\u0441\u044b\u043b\u043a\u0438',
                'verbose_name_plural': '\u0428\u0430\u0431\u043b\u043e\u043d\u044b \u0440\u0430\u0441\u0441\u044b\u043b\u043e\u043a Email',
            },
        ),
        migrations.CreateModel(
            name='TemplateSms',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=250, null=True, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a', blank=True)),
                ('text', models.TextField(null=True, verbose_name='\u0422\u0435\u043a\u0441\u0442', blank=True)),
                ('signature', models.CharField(max_length=250, null=True, verbose_name='\u041f\u043e\u0434\u043f\u0438\u0441\u044c', blank=True)),
            ],
            options={
                'verbose_name': '\u0428\u0430\u0431\u043b\u043e\u043d SMS \u0440\u0430\u0441\u0441\u044b\u043b\u043a\u0438',
                'verbose_name_plural': '\u0428\u0430\u0431\u043b\u043e\u043d\u044b \u0440\u0430\u0441\u0441\u044b\u043b\u043e\u043a SMS',
            },
        ),
    ]

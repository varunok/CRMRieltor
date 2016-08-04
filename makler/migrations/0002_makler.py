# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('makler', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Makler',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, null=True, verbose_name='\u0418\u043c\u044f', blank=True)),
                ('agency', models.CharField(max_length=30, null=True, verbose_name='\u0410\u0433\u0435\u043d\u0441\u0442\u0432\u043e', blank=True)),
                ('white_black', models.NullBooleanField(verbose_name='\u0422\u0438\u043f \u043c\u0430\u043a\u043b\u0435\u0440\u0430')),
                ('phone', models.IntegerField(null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True)),
                ('site', models.URLField(null=True, verbose_name='\u0421\u0430\u0439\u0442', blank=True)),
                ('email', models.EmailField(max_length=254, null=True, verbose_name='Email', blank=True)),
            ],
            options={
                'verbose_name': '\u041c\u0430\u043a\u043b\u0435\u0440',
                'verbose_name_plural': '\u041c\u0430\u043a\u043b\u0435\u0440\u0430',
            },
        ),
    ]

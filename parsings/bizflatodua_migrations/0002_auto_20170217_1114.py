# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('parsings', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ConfigParserOLXSolo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('CITY', models.CharField(max_length=50, null=True, verbose_name='\u0413\u043e\u0440\u043e\u0434', blank=True)),
                ('SITE_URL', models.CharField(max_length=250, null=True, verbose_name='SITE_URL', blank=True)),
                ('AJAX_PHONE', models.CharField(max_length=250, null=True, verbose_name='AJAX_PHONE', blank=True)),
                ('SELECTOR_GETLINK_CATEGORIES', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_GETLINK_CATEGORIES', blank=True)),
                ('SELECTOR_GETTEXT_CATEGORIES', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_GETTEXT_CATEGORIES', blank=True)),
                ('SELECTOR_GETLINK_ARTICLES', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_GETLINK_ARTICLES', blank=True)),
                ('SELECTOR_SITY', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_SITY', blank=True)),
                ('SELECTOR_TITLE', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_TITLE', blank=True)),
                ('SELECTOR_DATE', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_DATE', blank=True)),
                ('SELECTOR_PRICE', models.CharField(max_length=250, null=True, verbose_name='SELECTOR_PRICE', blank=True)),
            ],
            options={
                'verbose_name': '\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u043f\u0430\u0440\u0441\u0435\u0440\u0430',
                'verbose_name_plural': '\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043f\u0430\u0440\u0441\u0435\u0440\u0430',
            },
        ),
        migrations.DeleteModel(
            name='ConfigParserOLX',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0013_auto_20160725_1748'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeStage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('stage', models.CharField(max_length=150, null=True, verbose_name=b'\xd0\xa2\xd0\xb8\xd0\xbf \xd0\xad\xd1\x82\xd0\xb0\xd0\xbf\xd0\xb0', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u042d\u0442\u0430\u043f\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u0438 \u042d\u0442\u0430\u043f\u043e\u0432',
            },
        ),
        migrations.AddField(
            model_name='arendator',
            name='area_from',
            field=models.IntegerField(null=True, verbose_name='\u041f\u043b\u043e\u0449\u0430\u0434\u044c \u041e\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='area_to',
            field=models.IntegerField(null=True, verbose_name='\u041f\u043b\u043e\u0449\u0430\u0434\u044c \u0414\u043e', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='date_term',
            field=models.DateField(null=True, verbose_name=b'\xd0\xa1\xd1\x80\xd0\xbe\xd0\xba\xd0\xb8', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='floors_from',
            field=models.IntegerField(null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u041e\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='floors_to',
            field=models.IntegerField(null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u0414\u043e', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='price_from',
            field=models.IntegerField(null=True, verbose_name='\u0426\u0435\u043d\u0430 \u041e\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='price_to',
            field=models.IntegerField(null=True, verbose_name='\u0426\u0435\u043d\u0430 \u0414\u043e', blank=True),
        ),
    ]

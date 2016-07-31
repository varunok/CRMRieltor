# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0017_auto_20160725_2024'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='call_date',
            field=models.DateField(null=True, verbose_name='\u0412\u0440\u0435\u043c\u044f \u0437\u0432\u043e\u043d\u043a\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='comment',
            field=models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='date_term',
            field=models.DateField(null=True, verbose_name='\u0421\u0440\u043e\u043a\u0438', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='email',
            field=models.EmailField(max_length=254, null=True, verbose_name='\u0415\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u0430\u044f \u043f\u043e\u0447\u0442\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='phone_first',
            field=models.IntegerField(null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 1', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='phone_second',
            field=models.IntegerField(null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 2', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='review_date',
            field=models.DateField(auto_now=True, verbose_name='\u0414\u0430\u0442\u0430 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f', null=True),
        ),
    ]

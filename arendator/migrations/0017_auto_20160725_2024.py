# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0016_auto_20160725_1923'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='call_date',
            field=models.DateField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0414\u0430\u0442\u0430', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='name_user_trash',
            field=models.CharField(max_length=100, null=True, verbose_name=b'\xd0\x9a\xd1\x82\xd0\xbe \xd1\x83\xd0\xb4\xd0\xb0\xd0\xbb\xd0\xb8\xd0\xbb', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='review_date',
            field=models.DateField(auto_now=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0414\u0430\u0442\u0430', null=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='time_trash',
            field=models.DateTimeField(null=True, verbose_name=b'\xd0\x92\xd1\x80\xd0\xb5\xd0\xbc\xd1\x8f \xd1\x83\xd0\xb4\xd0\xb0\xd0\xbb\xd0\xb5\xd0\xbd\xd0\xb8\xd1\x8f', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='trash',
            field=models.BooleanField(default=False, verbose_name=b'\xd0\x9a\xd0\xbe\xd1\x80\xd0\xb7\xd0\xb8\xd0\xbd\xd0\xb0'),
        ),
    ]

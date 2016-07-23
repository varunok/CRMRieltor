# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0035_auto_20160715_1817'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='name_user_trash',
            field=models.CharField(max_length=100, null=True, verbose_name=b'\xd0\x9a\xd1\x82\xd0\xbe \xd1\x83\xd0\xb4\xd0\xb0\xd0\xbb\xd0\xb8\xd0\xbb', blank=True),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='time_trash',
            field=models.DateTimeField(null=True, verbose_name=b'\xd0\x92\xd1\x80\xd0\xb5\xd0\xbc\xd1\x8f \xd1\x83\xd0\xb4\xd0\xb0\xd0\xbb\xd0\xb5\xd0\xbd\xd0\xb8\xd1\x8f', blank=True),
        ),
    ]

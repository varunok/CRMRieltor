# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0007_auto_20160725_1643'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='comment',
            field=models.TextField(null=True, verbose_name=b'\xd0\x9a\xd0\xbe\xd0\xbc\xd0\xb5\xd0\xbd\xd1\x82\xd0\xb0\xd1\x80\xd0\xb8\xd0\xb9', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='email',
            field=models.EmailField(max_length=254, null=True, verbose_name=b'\xd0\x95\xd0\xbb\xd0\xb5\xd0\xba\xd1\x82\xd1\x80\xd0\xbe\xd0\xbd\xd0\xbd\xd0\xb0\xd1\x8f \xd0\xbf\xd0\xbe\xd1\x87\xd1\x82\xd0\xb0', blank=True),
        ),
    ]

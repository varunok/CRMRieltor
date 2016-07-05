# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0018_auto_20160704_0325'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='email_owner',
            field=models.EmailField(max_length=150, null=True, verbose_name='E-mail \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True),
        ),
    ]

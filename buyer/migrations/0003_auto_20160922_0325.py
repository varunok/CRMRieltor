# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buyer', '0002_auto_20160912_0018'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='buyer',
            unique_together=set([('name', 'phone_first')]),
        ),
    ]

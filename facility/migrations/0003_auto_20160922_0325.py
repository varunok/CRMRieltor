# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160922_0309'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='contactowner',
            unique_together=set([('name_owner', 'phone_owner')]),
        ),
    ]

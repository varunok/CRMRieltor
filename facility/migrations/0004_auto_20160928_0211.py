# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0003_auto_20160922_0325'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='contactowner',
            unique_together=set([]),
        ),
    ]

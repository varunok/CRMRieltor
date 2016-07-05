# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0023_auto_20160704_0449'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='phoneowner',
            name='phone_plus',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0004_auto_20160707_0522'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TypeLoyality',
        ),
    ]

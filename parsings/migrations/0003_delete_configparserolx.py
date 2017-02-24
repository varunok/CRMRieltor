# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('parsings', '0002_configparserolxsolo'),
    ]

    operations = [
        migrations.DeleteModel(
            name='ConfigParserOLX',
        ),
    ]

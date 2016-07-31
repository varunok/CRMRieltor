# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0004_tie_shows_arendator'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tie',
            name='shows_arendator',
        ),
    ]

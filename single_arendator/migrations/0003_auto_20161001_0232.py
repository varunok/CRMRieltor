# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_arendator', '0002_shows'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='shows',
            name='array_arendator',
        ),
        migrations.RemoveField(
            model_name='shows',
            name='array_cont_ower',
        ),
        migrations.RemoveField(
            model_name='shows',
            name='type_shows_arendator',
        ),
        migrations.DeleteModel(
            name='Shows',
        ),
    ]

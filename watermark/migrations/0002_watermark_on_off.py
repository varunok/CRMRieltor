# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('watermark', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='watermark',
            name='on_off',
            field=models.BooleanField(default=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0005_addressfacilitydata_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='addressfacilitydata',
            name='image',
        ),
    ]

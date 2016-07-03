# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0011_contactowner'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contactowner',
            name='id',
        ),
        migrations.AddField(
            model_name='contactowner',
            name='addressfacilitydata_ptr',
            field=models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, default=1, serialize=False, to='facility.AddressFacilityData'),
            preserve_default=False,
        ),
    ]

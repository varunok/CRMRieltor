# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0026_auto_20160704_0505'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner_plus',
            field=models.OneToOneField(related_name='phone_plus', null=True, on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.PhoneOwner'),
        ),
    ]

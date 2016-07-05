# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0027_auto_20160704_0515'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner_plus',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.PROTECT, to_field=b'phone_owner', blank=True, to='facility.ContactOwner'),
        ),
    ]

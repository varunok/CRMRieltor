# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0024_remove_phoneowner_phone_plus'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='phone_owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.PhoneOwner', null=True),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='phone_owner_plus',
            field=models.ForeignKey(related_name='phone_owner', on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.PhoneOwner', null=True),
        ),
    ]

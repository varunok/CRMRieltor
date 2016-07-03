# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0012_auto_20160703_0610'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactowner',
            name='contact_owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, default=1, to='facility.TypeContactOwner'),
            preserve_default=False,
        ),
    ]

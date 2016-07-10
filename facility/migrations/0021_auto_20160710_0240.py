# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0020_addressfacilitydata_public'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagesfacility',
            name='album',
            field=models.ForeignKey(related_name='photos', verbose_name='\u0410\u043b\u044c\u0431\u043e\u043c', to='facility.AddressFacilityData'),
        ),
    ]

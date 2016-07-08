# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0003_addressfacilitydata_rieltor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='loyality',
            field=models.ManyToManyField(related_name='loyal', verbose_name='\u041b\u043e\u044f\u043b\u044c\u043d\u043e\u0441\u0442\u044c', to='facility.UserFullName'),
        ),
    ]

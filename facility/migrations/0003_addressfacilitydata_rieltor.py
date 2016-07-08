# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_userfullname'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='rieltor',
            field=models.ManyToManyField(to='facility.UserFullName', verbose_name='\u0420\u0438\u0435\u043b\u0442\u043e\u0440'),
        ),
    ]

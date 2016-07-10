# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0019_addressfacilitydata_date_added'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='public',
            field=models.BooleanField(default=0, verbose_name='\u041f\u0443\u0431\u043b\u0438\u043a\u0443\u0435\u0442\u044c\u0441\u044f'),
            preserve_default=False,
        ),
    ]

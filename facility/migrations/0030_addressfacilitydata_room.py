# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0029_typerooms'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='room',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442\u044b', blank=True, to='facility.TypeRooms', null=True),
        ),
    ]

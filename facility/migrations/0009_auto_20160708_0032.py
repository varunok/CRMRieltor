# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0008_auto_20160708_0022'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='actuality',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0410\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u044c', blank=True, to='facility.TypeActuality'),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='condition',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0435', blank=True, to='facility.TypeCondition'),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='loyality',
            field=models.ManyToManyField(related_name='loyal', verbose_name='\u041b\u043e\u044f\u043b\u044c\u043d\u043e\u0441\u0442\u044c', to='facility.UserFullName', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='rieltor',
            field=models.ManyToManyField(to='facility.UserFullName', verbose_name='\u0420\u0438\u0435\u043b\u0442\u043e\u0440', blank=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0013_typeequipment_typefurniture_typeheating_typelavatory_typenumberofperson_typeprepayment_typethepresen'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='number_of_persons',
            field=models.ManyToManyField(to='facility.TypeNumberOfPerson', verbose_name='\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0447\u0435\u043b\u043e\u0432\u0435\u043a', blank=True),
        ),
    ]

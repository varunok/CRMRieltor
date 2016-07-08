# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0007_auto_20160708_0012'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='comment',
            field=models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439'),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='call_date',
            field=models.DateField(null=True, verbose_name='\u0417\u0432\u043e\u043d\u043e\u043a \u0414\u0430\u0442\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='contact_owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True, to='facility.TypeContactOwner', null=True),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner',
            field=models.CharField(max_length=16, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d'),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='review_date',
            field=models.DateField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0414\u0430\u0442\u0430', blank=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasking', '0003_tasking_add_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tasking',
            name='task_arendator',
            field=models.ForeignKey(verbose_name='ID(A) \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440', blank=True, to='arendator.Arendator', null=True),
        ),
        migrations.AlterField(
            model_name='tasking',
            name='task_buyer',
            field=models.ForeignKey(verbose_name='ID(P) \u041f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044c', blank=True, to='buyer.Buyer', null=True),
        ),
        migrations.AlterField(
            model_name='tasking',
            name='task_facility',
            field=models.ForeignKey(verbose_name='ID(O) \u041e\u0431\u044a\u0435\u043a\u0442', blank=True, to='facility.ContactOwner', null=True),
        ),
    ]

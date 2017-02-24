# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0002_auto_20160926_1014'),
    ]

    operations = [
        migrations.AlterField(
            model_name='showsarendator',
            name='array_arendator',
            field=models.ForeignKey(to='arendator.Arendator', null=True),
        ),
        migrations.AlterField(
            model_name='showsarendator',
            name='array_cont_ower',
            field=models.ForeignKey(to='facility.ContactOwner', null=True),
        ),
        migrations.AlterField(
            model_name='showsbuyer',
            name='array_buyer',
            field=models.ForeignKey(to='buyer.Buyer', null=True),
        ),
        migrations.AlterField(
            model_name='showsbuyer',
            name='array_cont_ower',
            field=models.ForeignKey(to='facility.ContactOwner', null=True),
        ),
    ]

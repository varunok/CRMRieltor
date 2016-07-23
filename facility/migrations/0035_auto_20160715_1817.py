# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0034_auto_20160715_1635'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='trash',
            field=models.BooleanField(default=False, verbose_name=b'\xd0\x9a\xd0\xbe\xd1\x80\xd0\xb7\xd0\xb8\xd0\xbd\xd0\xb0'),
        ),
        migrations.AlterField(
            model_name='phoneowner',
            name='phone',
            field=models.ForeignKey(blank=True, to='facility.ContactOwner', null=True),
        ),
    ]

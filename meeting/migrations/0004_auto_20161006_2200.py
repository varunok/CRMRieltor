# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meeting', '0003_meeting_add_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='meeting',
            name='meet_facility',
            field=models.ForeignKey(verbose_name='ID(O) \u041e\u0431\u044a\u0435\u043a\u0442', blank=True, to='facility.ContactOwner', null=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0019_contactowner_email_owner'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='vip_owner',
            field=models.NullBooleanField(verbose_name=b'Vip'),
        ),
    ]

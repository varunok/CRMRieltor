# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meeting', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='meeting',
            options={'ordering': ['meet_date'], 'verbose_name': '\u0412\u0441\u0442\u0440\u0435\u0447\u0438', 'verbose_name_plural': '\u0412\u0441\u0442\u0440\u0435\u0447\u0438'},
        ),
    ]

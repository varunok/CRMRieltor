# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasking', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='tasking',
            options={'ordering': ['dead_line'], 'verbose_name': '\u0417\u0430\u0434\u0430\u0447\u0430', 'verbose_name_plural': '\u0417\u0430\u0434\u0430\u0447\u0438'},
        ),
    ]

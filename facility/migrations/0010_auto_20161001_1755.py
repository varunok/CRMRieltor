# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0009_auto_20161001_1559'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagesfacility',
            name='image',
            field=models.ImageField(upload_to=b'img_obj/%Y/%m/%d/%H/%M/', verbose_name='\u0424\u043e\u0442\u043e'),
        ),
    ]

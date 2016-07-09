# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0008_imagesfacility'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='images_count',
            field=models.IntegerField(default=1, verbose_name='\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0444\u043e\u0442\u043e', editable=False),
            preserve_default=False,
        ),
    ]

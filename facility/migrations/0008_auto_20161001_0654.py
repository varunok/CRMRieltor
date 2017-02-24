# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0007_auto_20161001_0613'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='images_count',
            field=models.IntegerField(default=0, verbose_name='\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0444\u043e\u0442\u043e'),
        ),
        migrations.AlterField(
            model_name='imagesfacility',
            name='image',
            field=models.ImageField(upload_to=b'img_obj/ce37d9f8-878a-11e6-a03e-0018f35be757', verbose_name='\u0424\u043e\u0442\u043e'),
        ),
    ]

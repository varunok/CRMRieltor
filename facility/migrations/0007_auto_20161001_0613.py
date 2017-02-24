# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0006_auto_20160930_0415'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagesfacility',
            name='image',
            field=models.ImageField(upload_to=b'img_obj0483a97a-8785-11e6-b8e4-0018f35be757', verbose_name='\u0424\u043e\u0442\u043e'),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0008_auto_20161001_0654'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagesfacility',
            name='image',
            field=models.ImageField(upload_to=b'img_objea1d72ee-87d6-11e6-912c-0018f35be757', verbose_name='\u0424\u043e\u0442\u043e'),
        ),
    ]

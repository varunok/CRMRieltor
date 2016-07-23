# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0002_auto_20160720_0717'),
    ]

    operations = [
        migrations.AlterField(
            model_name='singleobjcomments',
            name='image',
            field=models.CharField(default=b'0', max_length=100),
        ),
    ]

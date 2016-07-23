# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0003_auto_20160720_0730'),
    ]

    operations = [
        migrations.AlterField(
            model_name='singleobjcomments',
            name='obj_comments',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041e\u0431\u044c\u0435\u043a\u0442', to='facility.ContactOwner'),
        ),
    ]

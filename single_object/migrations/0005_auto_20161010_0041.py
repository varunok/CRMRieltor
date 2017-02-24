# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0004_auto_20161005_0130'),
    ]

    operations = [
        migrations.AlterField(
            model_name='singleobjcomments',
            name='obj_comments',
            field=models.ForeignKey(verbose_name='\u041e\u0431\u044c\u0435\u043a\u0442', to='facility.ContactOwner'),
        ),
    ]

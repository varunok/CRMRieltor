# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_buyer', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='singlebuyercomments',
            name='obj_comments',
            field=models.ForeignKey(verbose_name='\u041e\u0431\u044c\u0435\u043a\u0442', to='buyer.Buyer'),
        ),
    ]

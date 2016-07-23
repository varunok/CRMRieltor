# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='singleobjcomments',
            name='image',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='singleobjcomments',
            name='obj_comments',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0410\u043b\u044c\u0431\u043e\u043c', to='facility.ContactOwner'),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0004_imagesalbum'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='image',
            field=models.ForeignKey(related_name='photo', on_delete=django.db.models.deletion.PROTECT, default=1, verbose_name='\u0424\u043e\u0442\u043e', to='facility.ImagesAlbum'),
            preserve_default=False,
        ),
    ]

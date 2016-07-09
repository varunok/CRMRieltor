# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0006_remove_addressfacilitydata_image'),
    ]

    operations = [
        migrations.DeleteModel(
            name='ImagesAlbum',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0003_delete_imagesalbum'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImagesAlbum',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('image', models.ImageField(upload_to=b'img_obj', max_length=255, verbose_name='\u0424\u043e\u0442\u043e')),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
    ]

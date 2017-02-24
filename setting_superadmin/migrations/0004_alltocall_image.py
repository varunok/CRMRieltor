# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_superadmin', '0003_auto_20160923_0216'),
    ]

    operations = [
        migrations.AddField(
            model_name='alltocall',
            name='image',
            field=models.ImageField(default=1, upload_to=b'admin_futer_avatar', verbose_name='\u0424\u043e\u0442\u043e'),
            preserve_default=False,
        ),
    ]

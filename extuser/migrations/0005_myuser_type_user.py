# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('extuser', '0004_usersgroupextuser'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='type_user',
            field=models.IntegerField(null=True, verbose_name='\u0422\u0438\u043f \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f'),
        ),
    ]

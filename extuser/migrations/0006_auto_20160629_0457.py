# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('extuser', '0005_myuser_type_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='type_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f', to='extuser.UsersGroupExtUser', null=True),
        ),
    ]

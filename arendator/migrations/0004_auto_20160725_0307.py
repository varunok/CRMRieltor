# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0003_arendator_type_state'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='rieltor',
            field=models.ManyToManyField(related_name='rielt', verbose_name='\u0420\u0438\u0435\u043b\u0442\u043e\u0440', to='arendator.UserFullName', blank=True),
        ),
    ]

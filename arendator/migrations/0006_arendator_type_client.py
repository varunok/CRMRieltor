# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0005_typeclient'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='type_client',
            field=models.ForeignKey(related_name='t_client', blank=True, to='arendator.TypeClient', null=True),
        ),
    ]

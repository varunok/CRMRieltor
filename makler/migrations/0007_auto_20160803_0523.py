# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('makler', '0006_auto_20160803_0514'),
    ]

    operations = [
        migrations.AlterField(
            model_name='makler',
            name='white_black',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, default=1, verbose_name='\u0422\u0438\u043f \u043c\u0430\u043a\u043b\u0435\u0440\u0430', to='makler.TypeWhiteBlack'),
            preserve_default=False,
        ),
    ]

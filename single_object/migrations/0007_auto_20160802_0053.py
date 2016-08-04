# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0006_auto_20160730_2058'),
    ]

    operations = [
        migrations.AddField(
            model_name='singleobjcomments',
            name='type_tabs',
            field=models.CharField(default='comment', max_length=20, verbose_name='\u041a\u0430\u043a\u0430\u044f \u0432\u043a\u043b\u0430\u0434\u043a\u0430?'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='showsarendator',
            name='type_shows_arendator',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, default=1, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c', to='single_object.TypeShows', null=True),
        ),
    ]

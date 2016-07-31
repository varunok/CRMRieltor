# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160725_0144'),
        ('single_object', '0005_remove_tie_shows_arendator'),
    ]

    operations = [
        migrations.AddField(
            model_name='showsarendator',
            name='array_cont_ower',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='facility.ContactOwner', null=True),
        ),
        migrations.AlterField(
            model_name='showsarendator',
            name='array_arendator',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='arendator.Arendator', null=True),
        ),
        migrations.AlterField(
            model_name='showsarendator',
            name='type_shows_arendator',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c', to='single_object.TypeShows', null=True),
        ),
    ]

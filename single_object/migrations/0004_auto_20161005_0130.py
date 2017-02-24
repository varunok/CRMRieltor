# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0003_auto_20160926_1036'),
    ]

    operations = [
        migrations.AlterField(
            model_name='showsarendator',
            name='type_shows_arendator',
            field=models.ForeignKey(verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c', to='single_object.TypeShows', null=True),
        ),
        migrations.AlterField(
            model_name='showsbuyer',
            name='type_shows_buyer',
            field=models.ForeignKey(verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u041f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044e', to='single_object.TypeShows', null=True),
        ),
    ]

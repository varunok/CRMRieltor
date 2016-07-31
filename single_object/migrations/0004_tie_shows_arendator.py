# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0003_showsarendator'),
    ]

    operations = [
        migrations.AddField(
            model_name='tie',
            name='shows_arendator',
            field=models.OneToOneField(default=1, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c', to='single_object.ShowsArendator'),
            preserve_default=False,
        ),
    ]

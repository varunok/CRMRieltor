# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('send_messege_user', '0005_auto_20160723_0312'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermessage',
            name='from_user',
            field=models.ForeignKey(related_name='from_us', on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041e\u0442 \u043a\u043e\u0433\u043e?', to_field=b'user', to='extuser.MyUser'),
        ),
    ]

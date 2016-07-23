# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('send_messege_user', '0003_usermessage_time_message'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermessage',
            name='user_message',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041a\u043e\u043c\u0443?', to='extuser.MyUser'),
        ),
    ]

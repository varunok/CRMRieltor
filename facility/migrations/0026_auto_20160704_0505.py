# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0025_auto_20160704_0456'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='contactowner',
            options={'verbose_name': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', 'verbose_name_plural': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432'},
        ),
        migrations.AlterModelOptions(
            name='phoneowner',
            options={'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', 'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432'},
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.PhoneOwner'),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner_plus',
            field=models.OneToOneField(related_name='phone_owner', null=True, on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.PhoneOwner'),
        ),
    ]

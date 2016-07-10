# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0015_auto_20160710_0137'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='furniture',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041c\u0435\u0431\u0435\u043b\u044c', blank=True, to='facility.TypeFurniture', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='heating',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041e\u0442\u043e\u043f\u043b\u0435\u043d\u0438\u0435', blank=True, to='facility.TypeHeating', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='lavatory',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u0430\u043d\u0443\u0437\u0435\u043b', blank=True, to='facility.TypeLavatory', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='lot',
            field=models.IntegerField(default=0, verbose_name='\u0423\u0447\u0430\u0441\u0442\u043e\u043a'),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='prepayment',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041f\u0440\u0435\u0434\u043e\u043f\u043b\u0430\u0442\u0430', blank=True, to='facility.TypePrepayment', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='sleeps',
            field=models.IntegerField(default=0, verbose_name='\u0421\u043f\u0430\u043b\u044c\u043d\u044b\u0445 \u043c\u0435\u0441\u0442'),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='where_to_stay',
            field=models.ManyToManyField(to='facility.TypeWhereToStay', verbose_name='\u0413\u0434\u0435 \u0441\u043f\u0430\u0442\u044c ?', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='windows',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041e\u043a\u043d\u0430', blank=True, to='facility.TypeWindows', null=True),
        ),
    ]

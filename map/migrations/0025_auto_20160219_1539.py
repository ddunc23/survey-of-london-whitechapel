# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0024_auto_20160219_1538'),
    ]

    operations = [
        migrations.AlterField(
            model_name='story',
            name='neighbourhood',
            field=models.ForeignKey(blank=True, to='map.Neighbourhood', null=True, on_delete=models.SET_NULL),
        ),
        migrations.AlterField(
            model_name='story',
            name='os_id',
            field=models.ForeignKey(blank=True, to='map.OS_Feature', null=True, on_delete=models.SET_NULL),
        ),
    ]

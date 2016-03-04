# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0043_auto_20160301_1306'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='end_year',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='document',
            name='start_year',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='geom',
            field=django.contrib.gis.db.models.fields.PolygonField(srid=4326),
        ),
    ]

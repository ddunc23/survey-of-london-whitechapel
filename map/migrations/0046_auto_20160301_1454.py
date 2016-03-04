# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0045_auto_20160301_1453'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='geom',
            field=django.contrib.gis.db.models.fields.PolygonField(srid=4326),
        ),
    ]

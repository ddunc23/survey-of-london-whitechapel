# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import djgeojson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0002_auto_20160202_1131'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='title',
            field=models.CharField(default='test', max_length=128),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='feature',
            name='geoJSON',
            field=djgeojson.fields.GeoJSONField(),
        ),
    ]

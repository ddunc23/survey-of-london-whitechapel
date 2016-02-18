# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import djgeojson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0004_auto_20160210_1231'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='geoJSON',
            field=djgeojson.fields.PolygonField(),
        ),
    ]

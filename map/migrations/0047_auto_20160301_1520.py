# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import djgeojson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0046_auto_20160301_1454'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='geom',
            field=djgeojson.fields.PolygonField(),
        ),
    ]

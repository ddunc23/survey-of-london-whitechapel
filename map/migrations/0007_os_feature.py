# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import djgeojson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0006_auto_20160210_1442'),
    ]

    operations = [
        migrations.CreateModel(
            name='OS_Feature',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('os_id', models.CharField(max_length=128)),
                ('geom', djgeojson.fields.PolygonField()),
            ],
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0005_auto_20160210_1326'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='geoJSON',
            new_name='geom',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0013_auto_20160217_1346'),
    ]

    operations = [
        migrations.RenameField(
            model_name='os_feature',
            old_name='os_id',
            new_name='osm_id',
        ),
    ]

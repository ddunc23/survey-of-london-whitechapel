# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0014_auto_20160217_1347'),
    ]

    operations = [
        migrations.RenameField(
            model_name='os_feature',
            old_name='osm_id',
            new_name='os_id',
        ),
    ]

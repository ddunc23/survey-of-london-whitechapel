# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0003_auto_20160202_1447'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='title',
            new_name='osm_id',
        ),
    ]

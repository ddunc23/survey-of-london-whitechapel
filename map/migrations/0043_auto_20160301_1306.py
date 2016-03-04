# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0042_feature_house_number'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='house_number',
            new_name='house_nmbr',
        ),
    ]

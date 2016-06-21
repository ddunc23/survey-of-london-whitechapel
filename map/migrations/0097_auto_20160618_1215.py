# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0096_auto_20160618_1214'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='rebuild_2',
            new_name='previous_2',
        ),
    ]

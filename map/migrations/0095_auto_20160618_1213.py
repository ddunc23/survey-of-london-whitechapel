# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0094_auto_20160618_1209'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='original',
            new_name='current',
        ),
    ]

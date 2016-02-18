# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0012_os_feature_featcode'),
    ]

    operations = [
        migrations.RenameField(
            model_name='os_feature',
            old_name='ADDRESS',
            new_name='address',
        ),
        migrations.RemoveField(
            model_name='os_feature',
            name='FEATCODE',
        ),
    ]

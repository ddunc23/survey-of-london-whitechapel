# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0095_auto_20160618_1213'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='rebuild_1',
            new_name='previous_1',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0059_auto_20160404_1139'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feature',
            name='basement',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0078_auto_20160428_1124'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feature',
            name='banner',
        ),
    ]

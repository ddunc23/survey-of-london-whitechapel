# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0073_auto_20160419_1107'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='caption',
        ),
    ]

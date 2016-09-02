# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0013_auto_20160815_0933'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='page',
            name='features',
        ),
    ]

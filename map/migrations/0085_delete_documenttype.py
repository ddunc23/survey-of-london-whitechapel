# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0084_auto_20160510_1445'),
    ]

    operations = [
        migrations.DeleteModel(
            name='DocumentType',
        ),
    ]

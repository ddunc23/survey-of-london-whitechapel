# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0040_auto_20160226_1628'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='street',
            field=models.CharField(max_length=128, null=True, blank=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0089_auto_20160606_1424'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='created',
            field=models.DateField(auto_now_add=True, null=True),
        ),
    ]

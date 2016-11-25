# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0106_auto_20160825_1010'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='copyright',
            field=models.BooleanField(default=False),
        ),
    ]

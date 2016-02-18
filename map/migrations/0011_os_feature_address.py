# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0010_os_feature_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='os_feature',
            name='ADDRESS',
            field=models.CharField(default='', max_length=255),
            preserve_default=False,
        ),
    ]

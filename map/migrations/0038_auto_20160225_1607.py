# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import map.models


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0037_auto_20160224_1702'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='thumbnail',
            field=models.ImageField(null=True, upload_to=map.models.feature_directory_path, blank=True),
        ),
    ]

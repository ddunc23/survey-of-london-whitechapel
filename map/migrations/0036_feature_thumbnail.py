# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import map.models


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0035_feature_short_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='thumbnail',
            field=models.ImageField(null=True, upload_to=map.models.feature_directory_path),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import map.models


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0085_delete_documenttype'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='f_date',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Facade Date', blank=True),
        ),
        migrations.AlterField(
            model_name='image',
            name='file',
            field=models.ImageField(upload_to=map.models.feature_directory_path, null=True, verbose_name=b'Image'),
        ),
    ]

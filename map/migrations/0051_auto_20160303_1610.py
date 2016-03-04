# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import map.models
import taggit.managers


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0050_feature_tags'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='banner',
            field=models.ImageField(null=True, upload_to=map.models.feature_directory_path, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='short_description',
            field=models.CharField(max_length=140, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='tags',
            field=taggit.managers.TaggableManager(to='taggit.Tag', through='taggit.TaggedItem', blank=True, help_text='A comma-separated list of tags.', verbose_name='Tags'),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import filebrowser.fields


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0008_auto_20160421_1046'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='banner_image_browsable',
            field=filebrowser.fields.FileBrowseField(max_length=200, null=True, verbose_name=b'Image', blank=True),
        ),
    ]

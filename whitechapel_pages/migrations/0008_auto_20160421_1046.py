# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0076_media'),
        ('whitechapel_pages', '0007_page_banner_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='images',
            field=models.ManyToManyField(to='map.Image', blank=True),
        ),
        migrations.AddField(
            model_name='page',
            name='media',
            field=models.ManyToManyField(to='map.Media', blank=True),
        ),
    ]

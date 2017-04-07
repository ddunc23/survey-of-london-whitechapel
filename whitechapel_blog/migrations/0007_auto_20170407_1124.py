# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0006_post_past_event'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='post_preview',
            field=models.CharField(max_length=140, blank=True),
        ),
        migrations.AddField(
            model_name='post',
            name='post_thumbnail',
            field=models.ImageField(upload_to=b'', null=True, verbose_name=b'Thumbnail Image', blank=True),
        ),
    ]

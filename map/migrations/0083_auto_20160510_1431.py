# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import embed_video.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0082_auto_20160510_1344'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='short_description',
            field=models.CharField(max_length=140, null=True, verbose_name=b'Short Description', blank=True),
        ),
        migrations.AlterField(
            model_name='media',
            name='url',
            field=embed_video.fields.EmbedVideoField(),
        ),
    ]

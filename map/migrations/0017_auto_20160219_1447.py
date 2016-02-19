# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0016_auto_20160218_1105'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Feature',
        ),
        migrations.AlterField(
            model_name='document',
            name='body',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True),
        ),
    ]

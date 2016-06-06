# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0088_auto_20160526_1039'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='body',
            field=ckeditor_uploader.fields.RichTextUploadingField(),
        ),
    ]

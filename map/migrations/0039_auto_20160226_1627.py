# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0038_auto_20160225_1607'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='body',
            field=ckeditor.fields.RichTextField(blank=True),
        ),
    ]

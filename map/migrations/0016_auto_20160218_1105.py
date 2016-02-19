# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0015_auto_20160217_1402'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='body',
            field=ckeditor.fields.RichTextField(blank=True),
        ),
    ]

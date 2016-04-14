# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0067_document_last_edited'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='body_processed',
            field=models.TextField(null=True, blank=True),
        ),
    ]

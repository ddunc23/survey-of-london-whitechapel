# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0065_document_published'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='pending',
            field=models.BooleanField(default=False),
        ),
    ]

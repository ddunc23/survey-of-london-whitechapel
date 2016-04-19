# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0068_document_body_processed'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='anonymise',
            field=models.BooleanField(default=False),
        ),
    ]

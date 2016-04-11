# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0066_document_pending'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='last_edited',
            field=models.DateField(auto_now=True, null=True),
        ),
    ]

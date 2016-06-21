# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0090_document_created'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='created',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='media',
            name='created',
            field=models.DateField(auto_now_add=True, null=True),
        ),
    ]

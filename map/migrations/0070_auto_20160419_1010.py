# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0069_document_anonymise'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='story',
            name='feature',
        ),
        migrations.DeleteModel(
            name='Story',
        ),
    ]

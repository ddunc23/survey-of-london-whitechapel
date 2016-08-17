# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0103_auto_20160622_0946'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='thumbnail_position',
            field=models.CharField(default=b'CENTRE', max_length=6, verbose_name=b'Header Image Alignment', choices=[(b'TOP', b'Top'), (b'CENTRE', b'Centre'), (b'BOTTOM', b'Bottom')]),
        ),
        migrations.AlterField(
            model_name='document',
            name='document_type',
            field=models.CharField(default=b'HISTORY', max_length=16, choices=[(b'HISTORY', b'Research'), (b'DESCRIPTION', b'Description'), (b'STORY', b'Memory'), (b'NOTE', b'Note')]),
        ),
    ]

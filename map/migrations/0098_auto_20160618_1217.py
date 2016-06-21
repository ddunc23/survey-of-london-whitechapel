# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0097_auto_20160618_1215'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='extension_1',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Extension/Alteration 1', blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='extension_2',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Extension/Alteration 2', blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='extension_3',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Extension/Alteration 3', blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='previous_3',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
    ]

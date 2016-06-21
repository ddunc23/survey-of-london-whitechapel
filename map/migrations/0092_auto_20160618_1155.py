# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0091_auto_20160614_0946'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='c_area',
            field=models.CharField(default=b'NO', choices=[(b'YES', b'Yes'), (b'NO', b'No')], max_length=8, blank=True, null=True, verbose_name=b'Conservation Area'),
        ),
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.CharField(default=b'NO', choices=[(b'NO', b'No'), (b'GRADE_1', b'I'), (b'GRADE_2', b'II'), (b'GRADE_2*', b'II*')], max_length=8, blank=True, null=True, verbose_name=b'Listed'),
        ),
    ]

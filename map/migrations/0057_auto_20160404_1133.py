# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0056_auto_20160404_1113'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='basement',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='feature',
            name='c_area',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0080_auto_20160428_1549'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='media',
            options={'verbose_name_plural': 'Media'},
        ),
        migrations.RenameField(
            model_name='feature',
            old_name='type',
            new_name='short_description',
        ),
    ]

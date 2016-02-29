# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0031_auto_20160224_1548'),
    ]

    operations = [
        migrations.RenameField(
            model_name='document',
            old_name='os_id',
            new_name='feature',
        ),
        migrations.RenameField(
            model_name='story',
            old_name='os_id',
            new_name='feature',
        ),
        migrations.RemoveField(
            model_name='story',
            name='neighbourhood',
        ),
        migrations.DeleteModel(
            name='Neighbourhood',
        ),
    ]

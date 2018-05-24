# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_users', '0005_auto_20160816_1157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='emails',
            field=models.BooleanField(default=False, verbose_name=b'Receive emails about your submissions from the Survey of London?'),
        ),
    ]

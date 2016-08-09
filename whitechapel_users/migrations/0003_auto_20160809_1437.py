# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_users', '0002_auto_20160809_1141'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='emails',
            field=models.BooleanField(default=True, verbose_name=b'Receive Email Updates from Survey of London?'),
        ),
    ]

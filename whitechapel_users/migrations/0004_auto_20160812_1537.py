# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_users', '0003_auto_20160809_1437'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='bio',
            field=models.CharField(max_length=420, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='emails',
            field=models.BooleanField(default=True, verbose_name=b'Receive emails about your submissions from the Survey of London?'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='newsletter',
            field=models.BooleanField(default=False, verbose_name=b'Subscribe to our newsletter'),
        ),
    ]

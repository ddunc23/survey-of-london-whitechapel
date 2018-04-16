# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_users', '0006_auto_20180416_0950'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='gdpr_confirm',
            field=models.BooleanField(default=False, verbose_name=b'Continue to receive emails from the Survey of London?'),
        ),
    ]

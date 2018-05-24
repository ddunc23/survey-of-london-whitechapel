# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_users', '0007_userprofile_gdpr_confirm'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='had_gdpr_notificaton',
            field=models.BooleanField(default=False),
        ),
    ]

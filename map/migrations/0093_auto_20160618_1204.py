# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0092_auto_20160618_1155'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.CharField(default=b'NO', choices=[(b'NO', b'Not Listed'), (b'GRADE_1', b'Grade I'), (b'GRADE_2', b'Grade II'), (b'GRADE_2*', b'Grade II*')], max_length=8, blank=True, null=True, verbose_name=b'Listed'),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0099_auto_20160618_1234'),
    ]

    operations = [
        migrations.CreateModel(
            name='Site',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=140)),
            ],
        ),
        migrations.AddField(
            model_name='feature',
            name='site',
            field=models.ManyToManyField(to='map.Site', blank=True),
        ),
    ]

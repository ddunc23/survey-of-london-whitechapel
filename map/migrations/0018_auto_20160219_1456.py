# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0017_auto_20160219_1447'),
    ]

    operations = [
        migrations.CreateModel(
            name='Neighbourhood',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=128, blank=True)),
            ],
        ),
        migrations.AddField(
            model_name='os_feature',
            name='neighbourhood',
            field=models.ForeignKey(to='map.Neighbourhood', null=True, on_delete=models.SET_NULL),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0053_document_author'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feature',
            old_name='house_nmbr',
            new_name='b_number',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='featcode',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='name',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='os_id',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='short_description',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='year_built',
        ),
        migrations.AddField(
            model_name='feature',
            name='architect',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='b_name',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='b_type',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='basement',
            field=models.NullBooleanField(),
        ),
        migrations.AddField(
            model_name='feature',
            name='builders',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='c_area',
            field=models.NullBooleanField(),
        ),
        migrations.AddField(
            model_name='feature',
            name='f_date',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='listed',
            field=models.NullBooleanField(),
        ),
        migrations.AddField(
            model_name='feature',
            name='materials',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='original',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='rebuild_1',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='rebuild_2',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='feature',
            name='storeys',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='address',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='feature',
            name='street',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]

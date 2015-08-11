# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0006_closingday'),
    ]

    operations = [
        migrations.AddField(
            model_name='appointment',
            name='details',
            field=models.CharField(max_length=1000, null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='appointment',
            name='email',
            field=models.EmailField(default=b'test@test.fr', max_length=75),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='appointment',
            name='first_name',
            field=models.CharField(default=b'test', max_length=50),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='appointment',
            name='last_name',
            field=models.CharField(default=b'test', max_length=50),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='appointment',
            name='phone',
            field=models.CharField(default=b'test', max_length=15),
            preserve_default=True,
        ),
    ]

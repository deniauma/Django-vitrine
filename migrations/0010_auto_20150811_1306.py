# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0009_auto_20150811_1257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='appointment',
            name='details',
            field=models.TextField(blank=True),
            preserve_default=True,
        ),
    ]

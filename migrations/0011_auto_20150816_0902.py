# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0010_auto_20150811_1306'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='page',
            name='page_content',
        ),
        migrations.RemoveField(
            model_name='page',
            name='page_html',
        ),
        migrations.RemoveField(
            model_name='page',
            name='page_title',
        ),
    ]

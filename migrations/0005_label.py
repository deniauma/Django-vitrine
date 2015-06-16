# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0004_page_page_html'),
    ]

    operations = [
        migrations.CreateModel(
            name='Label',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('label_place', models.CharField(max_length=20, choices=[(b'T', b'Title'), (b'C1', b'Content part 1'), (b'C2', b'Content part 2'), (b'C3', b'Content part 3'), (b'C4', b'Content part 4'), (b'C5', b'Content part 5'), (b'C6', b'Content part 6'), (b'C7', b'Content part 7'), (b'C8', b'Content part 8'), (b'C9', b'Content part 9'), (b'C10', b'Content part 10')])),
                ('label_text', tinymce.models.HTMLField()),
                ('label_page', models.ForeignKey(to='vitrine.Page')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

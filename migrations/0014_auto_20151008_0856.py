# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0013_auto_20150827_0933'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='meta_description',
            field=models.CharField(default="\xcatre libre de toute douleur physique et \xe9motionnelle. Espace de travail. A l'heure o\xf9 l'\xeatre humain recherche le naturel, le Reiki et le Magn\xe9tisme r\xe9pondent \xe0 cette attente l\xe9gitime.", max_length=200),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='page',
            name='meta_title',
            field=models.CharField(default='Eric Deniaud, practicien Reiki et magn\xe9tiseur', max_length=200),
            preserve_default=True,
        ),
    ]

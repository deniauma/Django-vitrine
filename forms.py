# -*- coding: utf-8 -*-
from django import forms

class AppointmentForm(forms.Form):
	appointment_date = forms.DateTimeField(label="Date du rendez-vous:", input_formats=['%d/%m/%Y %H:%M'])
	appointment_lastName = forms.CharField(label="Nom:", max_length=50)
	appointment_firstName = forms.CharField(label=u'Prénom:', max_length=50)
	appointment_email = forms.EmailField(label="E-mail:")
	appointment_phone = forms.CharField(label=u"Téléphone:", max_length=15)
	appointment_details = forms.CharField(label=u"Détails:", max_length=1000, widget=forms.Textarea, required=False)
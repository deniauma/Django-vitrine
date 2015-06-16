from django.contrib import admin
from vitrine.models import Page, Navigation, Appointment, Label

class NavigationAdmin(admin.ModelAdmin):
	list_display = ('link_label', 'link_order')

class LabelAdmin(admin.ModelAdmin):
	list_display = ('label_place', 'label_text')

admin.site.register(Page)
admin.site.register(Label, LabelAdmin)
admin.site.register(Navigation, NavigationAdmin)
admin.site.register(Appointment)
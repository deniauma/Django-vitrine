from django.contrib import admin
from vitrine.models import Page, Navigation, Appointment

class NavigationAdmin(admin.ModelAdmin):
	list_display = ('link_label', 'link_order')

admin.site.register(Page)
admin.site.register(Navigation, NavigationAdmin)
admin.site.register(Appointment)
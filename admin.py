from django.contrib import admin
from vitrine.models import Page, Navigation, Appointment, Label, ClosingDay

class NavigationAdmin(admin.ModelAdmin):
	list_display = ('link_label', 'link_order')

class LabelAdmin(admin.ModelAdmin):
	list_display = ('label_place', 'label_text')

class AppointmentAdmin(admin.ModelAdmin):
	list_display = ('start_date', 'validated')

class ClosingDayAdmin(admin.ModelAdmin):
	list_display = ('date', 'title')


admin.site.register(Page)
admin.site.register(Label, LabelAdmin)
admin.site.register(Navigation, NavigationAdmin)
admin.site.register(Appointment, AppointmentAdmin)
admin.site.register(ClosingDay, ClosingDayAdmin)
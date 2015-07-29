from django.shortcuts import render
from django.views import generic
from vitrine.models import Page, Navigation, Appointment

class IndexView(generic.ListView):
	template_name = 'index.html'
	context_object_name = 'page'
	def get_queryset(self):
		return Page.objects.filter(is_main_page=True).first()	

class PageView(generic.DetailView):
    model = Page
    slug_field = 'page_slug'
    slug_url_kwarg = 'page_slug'
    template_name = 'calendar.html'
    def get_context_data(self, **kwargs):
        context = super(PageView, self).get_context_data(**kwargs)
        navigation_links = Navigation.objects.all().order_by('link_order')
        context['navigation'] = navigation_links
        schedule_events = Appointment.objects.filter(validated=True)
        schedule_events_momentjs = []
        for event in schedule_events:
            #'2015-02-12T20:00:00'
            start_date = event.start_date.strftime('%Y-%m-%dT%H:%M:%S')
            end_date = event.end_date.strftime('%Y-%m-%dT%H:%M:%S')
            title = "Rendez-vous"
            schedule_events_momentjs.append({'start_date': start_date, 'end_date': end_date, 'title': title})
        context['schedule_events'] = schedule_events_momentjs
        return context

def calendar(request):
	context = []
	schedule_events = Appointment.objects.filter(validated=True)
	schedule_events_momentjs = []
	for event in schedule_events:
		#'2015-02-12T20:00:00'
		start_date = event.start_date.strftime('%Y-%m-%dT%H:%M:%S')
		end_date = event.end_date.strftime('%Y-%m-%dT%H:%M:%S')
		title = "Rendez-vous"
		schedule_events_momentjs.append({'start_date': start_date, 'end_date': end_date, 'title': title})
	context['schedule_events'] = schedule_events_momentjs
	return render(request, '/calendar.html', context)
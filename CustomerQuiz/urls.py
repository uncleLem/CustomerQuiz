from django.conf.urls import patterns, include, url
from quiz.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
                       ('^$', main_default), # default page
                       ('^quiz/$', default_question_sample),
                       ('^quiz/(\d)/$', question_sample),
                       ('^404/$', err404),
                       ('^main/$', main_default),
                       ('^login/$', login),
                       ('^logout/$', logout),
                       ('^register/$', register),
                       ('^new/$', new),
                       ('^finish/$', finish),
                       ('^projects/$', my_projects),
                       ('^project_info/$', project_info),
                       ('^contacts/$', contacts),
                       ('^clients/$', clients),
                       ('^analysis/$', analysis),
                       ('^submitted/$', submitted),
                       ('^started/$', started),
                       ('^pre_finished/$', pre_finished),
                       ('^finished/$', finished),
                       ('^recalculate/$', recalculate),
                       ('^recalculate_finished/$', recalculate_done),
                       # Examples:
                       # url(r'^$', 'CustomerQuiz.views.home', name='home'),
                       # url(r'^CustomerQuiz/', include('CustomerQuiz.foo.urls')),

                       # Uncomment the manager/doc line below to enable manager documentation:
                       # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

                       # Uncomment the next line to enable the manager:
                       url(r'^admin/', include(admin.site.urls)),
)

from django.conf.urls import patterns, url

from cats import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^submit/$', views.submit, name='submit'),
    url(r'^display/(\w+)-(?P<cat_id>\d+)/data/(?P<cat_data_id>\d+)/$',
        views.display_cat_data,
        name='display_cat_data'),
    url(r'^display/(\w+)-(?P<cat_id>\d+)/$',
        views.display_cat,
        name='display_cat'),
    url(r'^vote/(?P<cat_data_id>\d+)/$',
        views.vote,
        name='vote_catdata'),
    url(r'^search/search/$',
        views.search,
        name='search'),
)
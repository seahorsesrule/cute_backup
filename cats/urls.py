from django.conf.urls import patterns, url

from cats import views

urlpatterns = patterns('',
    # The main page
    url(r'^$',
        views.index,
        name='index'),

    # Submission form page
    url(r'^submit/$',
        views.submit,
        name='submit'),

    # Cat data page shows the photo the user has submitted
    url(r'^display/(\w+)-(?P<cat_id>\d+)/data/(?P<cat_data_id>\d+)/$',
        views.display_cat_data,
        name='display_cat_data'),

    # Cat page shows all submissions for one cat
    url(r'^display/(\w+)-(?P<cat_id>\d+)/$',
        views.display_cat,
        name='display_cat'),

    # AJAX load of average cuteness after user votes
    url(r'^vote/(?P<cat_data_id>\d+)/$',
        views.vote,
        name='vote_catdata'),

    # Search page
    url(r'^search/search/$',
        views.search,
        name='search'),
)
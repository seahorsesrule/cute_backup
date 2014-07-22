from django.contrib import admin
from django.db import models
from cats.models import Cat, CatData


class CatDataAdmin (admin.ModelAdmin):
    list_display = ( 'cat', 'photo', 'story', 'created')
    

admin.site.register(Cat)
admin.site.register(CatData, CatDataAdmin)

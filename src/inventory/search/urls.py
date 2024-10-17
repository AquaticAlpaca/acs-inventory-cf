from django.urls import path
from .views import search_view, search_parts

urlpatterns = [
    path('', search_view, name='search_view'),  # Render the search page
    path('search/', search_parts, name='search_parts'),
]

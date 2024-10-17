from django.shortcuts import render
from django.http import JsonResponse
from .models import Part
from django.db.models import Q

def search_view(request):
    return render(request, 'search/search.html')

def search_parts(request):
    query = request.GET.get('query', '')
    parts = Part.objects.filter(
        Q(part_number__icontains=query) |
        Q(description__icontains=query) |
        Q(manufacturer_part_number__icontains=query)
    )

    results = [
        {
            'part_number': part.part_number,
            'description': part.description,
            'manufacturer_part_number': part.manufacturer_part_number,
            'quantity': part.quantity,
            'location': part.location.name,
        }
        for part in parts
    ]

    return JsonResponse(results, safe=False)

"""
notesapp URL Configuration
"""

from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView

urlpatterns = [
    # ✅ Prometheus metrics endpoint (/metrics)
    path("", include("django_prometheus.urls")),

    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),

    # React frontend
    path('', TemplateView.as_view(template_name='index.html')),
]
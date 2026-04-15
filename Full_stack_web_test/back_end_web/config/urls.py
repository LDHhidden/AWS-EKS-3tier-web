from django.contrib import admin
from django.urls import path, include
from users.views import healthz, readyz

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("users.urls")),
    path("healthz", healthz),
    path("readyz", readyz),
]
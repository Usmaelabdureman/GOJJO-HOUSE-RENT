
from django.conf import settings
from django.contrib import admin
from django.urls import include, path

from gojjo.settings import STATIC_URL

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('posts.urls')),
    path('',include('users.urls')),
    path('request/',include('request.urls')),
    path('api-auth/',include('rest_framework.urls')),
    path('api/v1/rest-auth/', include('rest_auth.urls')),
    path('api/v1/rest-auth/registration/', 
          include('rest_auth.registration.urls')), 
]

urlpatterns += static(settings.MEDIA_URL,document_root = settings.MEDIA_ROOT)

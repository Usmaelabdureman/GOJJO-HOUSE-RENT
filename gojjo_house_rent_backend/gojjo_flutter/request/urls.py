from django.urls import path
from .views import RequestList,RequestDetail,UserRequestList


urlpatterns = [
path('<int:pk>/', RequestDetail.as_view()),
path('', RequestList.as_view()),
path('userequests/',UserRequestList.as_view())
]
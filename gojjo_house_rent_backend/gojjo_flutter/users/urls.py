from django.urls import path
from .views import CurrentUserData, UserDetail,UserList,CustomUserCreate


urlpatterns = [
path('users/', UserList.as_view()), 
path('users/<int:pk>/', UserDetail.as_view()),
path('create/',CustomUserCreate.as_view(),name='create_user'),
path('currentuser/',CurrentUserData.as_view())
]
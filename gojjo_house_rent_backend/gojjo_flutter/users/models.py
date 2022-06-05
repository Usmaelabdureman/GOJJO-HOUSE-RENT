
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractBaseUser,PermissionsMixin,BaseUserManager

class CustomUserManager(BaseUserManager):

    def create_superuser(self,email,username,first_name,middle_name,password,**other_fields):
        other_fields.setdefault('is_staff',True)
        other_fields.setdefault('is_superuser',True)
        other_fields.setdefault('is_active',True)
        # other_fields.setdefault('is_admin',True)
        if other_fields.get('is_staff') is not True:
            raise ValueError(
                'Superuser must be assigned to is_staff=True.'
            )
        if other_fields.get('is_superuser') is not True:
            raise ValueError(
                'Superuser must be assigned to is_superuser=True.'
            )
        return self.create_user(email,username,first_name,middle_name,password, **other_fields)


    def create_user(self,email,username,first_name,middle_name,password,**other_fields):
        if not email:
            raise ValueError(_("you must provide an email address"))
        email = self.normalize_email(email)
        user = self.model(email=email,username=username,first_name = first_name,middle_name =middle_name,**other_fields)
        user.set_password(password)
        user.save()

        return user



class User(AbstractBaseUser,PermissionsMixin):
    email = models.EmailField(_('email address'),unique=True)
    username = models.CharField(max_length=100,unique=True)
    first_name = models.CharField(max_length=100)
    middle_name = models.CharField(max_length=100)
    start_date = models.DateTimeField(auto_now_add=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)


    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username','first_name','middle_name']

    def __str__(self):
        return self.username



    

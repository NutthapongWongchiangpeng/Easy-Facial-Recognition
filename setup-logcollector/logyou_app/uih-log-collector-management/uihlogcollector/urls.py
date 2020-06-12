"""uihlogcollector URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import RedirectView
from django.conf import settings
from django.conf.urls import handler400, handler403, handler404,  handler500
from . import suburls,views

_real_path = settings.WEB_REAL_PATH
urlpatterns = [
    #default 
    path('', views.index),
    path('%s' %(_real_path), include('uihlogcollector.suburls')),    
    #path(''  , include('uihlogcollector.suburls')),   
]


handler400 =  'uihlogmaintemplate.views.error400'
handler403 =  'uihlogmaintemplate.views.error403'
handler404 =  'uihlogmaintemplate.views.error404'
handler500 =  'uihlogmaintemplate.views.error500'
from django.shortcuts import  redirect
from django.conf import settings
def index(request):
    return redirect("/%s" %settings.WEB_REAL_PATH)
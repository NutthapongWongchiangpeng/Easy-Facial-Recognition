"""
WSGI config for uihlogcollector project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
import django
#from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'uihlogcollector.settings')

#current
#application = get_wsgi_application()
from channels.routing import get_default_application
django.setup()
application = get_default_application()

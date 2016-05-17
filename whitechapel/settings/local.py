from .secret_settings import *
from .base import *
# from whitechapel.urls import urlpatterns

DEBUG = True

INSTALLED_APPS += ('debug_toolbar',)

def show_toolbar(request):
    return True
DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK" : show_toolbar,
}
from .secret_settings import *
from .base import *
# from whitechapel.urls import urlpatterns

DEBUG = True

INSTALLED_APPS += ('debug_toolbar',)

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

def show_toolbar(request):
    return True
DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK" : show_toolbar,
}

SESSION_EXPIRE_AT_BROWSER_CLOSE = True

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/home/duncan/logs/debug.log',
        },
    },
    'loggers': {
        'django.request': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
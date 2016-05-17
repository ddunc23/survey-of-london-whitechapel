from .secret_settings import *
from .base import *

DEBUG = False

ALLOWED_HOSTS = ['staging.local', 'dev.example.com']

# STATIC_ROOT = '/home/duncan/code/staging/survey-of-london-whitechapel/static/'

INSTALLED_APPS += ('mod_wsgi.server',)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/home/duncan/code/staging/survey-of-london-whitechapel/debug.log',
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
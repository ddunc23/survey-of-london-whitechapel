from .secret_settings import *
from .base import *

DEBUG = False

ALLOWED_HOSTS = ['staging.local', 'dev.example.com', 'surveyoflondon.org']

# STATIC_ROOT = '/home/duncan/code/staging/survey-of-london-whitechapel/static/'

SECURE_SSL_HOST = True

SESSION_COOKIE_SECURE = True

CSRF_COOKIE_SECURE = True

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

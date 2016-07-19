from .secret_settings import *
from .base import *

DEBUG = False

ALLOWED_HOSTS = ['surveyoflondon.org', 'staging.surveyoflondon.org', 'surveyoflondonmedia.org']

SECURE_SSL_HOST = True

SESSION_COOKIE_SECURE = True

CSRF_COOKIE_SECURE = True

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

MANAGERS = (
        ('Duncan Hay', 'd.hay@ucl.ac.uk'),
        ('Survey Editors', 'solwhitechapel.bartlett@ucl.ac.uk'),
    )

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': LOG_DIR + '/debug.log',
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

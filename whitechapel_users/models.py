from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserProfile(models.Model):
	"""Additional Attributes for the User model"""
	user = models.OneToOneField(User)
	display_name = models.CharField(max_length=100, blank=True, null=True, unique=True)
	bio = models.CharField(max_length=420, blank=True, null=True)
	emails = models.BooleanField(default=False, verbose_name='Receive emails about your submissions from the Survey of London?')
	newsletter = models.BooleanField(default=False, verbose_name='Subscribe to our newsletter')
	gdpr_confirm = models.BooleanField(default=False, verbose_name='Continue to receive emails from the Survey of London?')
	had_gdpr_notificaton = models.BooleanField(default=False)

	def __unicode__(self):
		if self.display_name != None:
			return self.display_name
		else:
			return self.user.username
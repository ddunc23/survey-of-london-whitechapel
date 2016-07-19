from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserProfile(models.Model):
	"""Additional Attributes for the User model"""
	user = models.OneToOneField(User)
	display_name = models.CharField(max_length=100, blank=True, null=True)

	def __unicode__(self):
		if self.display_name != null:
			return self.display_name
		else:
			return self.user.username
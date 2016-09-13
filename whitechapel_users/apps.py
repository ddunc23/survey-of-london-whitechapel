from django.apps import AppConfig

class WhitechapelUsersAppConfig(AppConfig):
	name = 'whitechapel_users'
	verbose_name = 'Users'
	def ready(self):
		import whitechapel_users.signals

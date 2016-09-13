from allauth.account.signals import user_signed_up
from django.dispatch import receiver
from django.core.mail.message import EmailMessage

def send_welcome_email(user):
	"""Send a welcome email to a new user"""
	subject = 'Welcome to the Survey of London Whitechapel Project'
	message = 'Thank you for joining us on the Whitechapel project. You have probably already explored the front page with its link to the interactive map, to blogs, and featured buildings, photos, interviews and film, and now you can add your own contributions. Just go to the map, click on the building you\'d like to tell us more about, and then the "Add Content" button. If you\'re not sure where the building is that you\'re looking for, there is a search field to help you find it. If you have any problems, just send us an email at solwhitechapel.bartlett@ucl.ac.uk. There is further information about how to add material at https://surveyoflondon.org/page/using-website/.\nWith best wishes,\nAileen Reid and Sarah Milne\nSurvey of London Whitechapel Project historians'
	email = EmailMessage(subject, message, 'admin@surveyoflondon.org', [user.email], ['solwhitechapel.bartlett@ucl.ac.uk'])
	email.send()

@receiver(user_signed_up, dispatch_uid='user_signup_welcome_email')
def send_signup_email(request, user, **kwargs):
	send_welcome_email(user)
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User
from django.core.mail import EmailMessage
import StringIO

class Command(BaseCommand):
	help = 'Exports the email address of every user who has ticked the "Subscribe to Newsletter" box on their user profile as a .csv and emails it to the Survey editors.'

	def add_arguments(self, parser):
		parser.add_argument(
			'--recipients',
			action='store',
			dest='recipients',
			default='',
			help='a comma-separated list of recipient email addresses'
		)

	def handle(self, *args, **options):
		csv_file = StringIO.StringIO()
		subscibers = []
		for user in User.objects.filter(userprofile__newsletter=True):
			csv_file.write(user.email + ',')

		recipients = ['d.hay@ucl.ac.uk']

		if options['recipients']:
			for recipient in options['recipients'].split(','):
				recipients.append(recipient)

		email = EmailMessage(
			subject='Subscribers List',
			body='A list of every user who has ticked the "Subscribe to Newsletter" box on their user profile',
			to=recipients,
		)

		email.attach('whitechapel_subscribers.csv', csv_file.getvalue(), 'text/csv')

		email.send()

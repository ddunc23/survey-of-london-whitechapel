#!/usr/bin/python
# A python script for creating daily, weekly, monthly, and annual backups and cleaning it up. This should be run daily from root CRON, making sure you activate the correct virtualenv first (otherwise it won't work)
import sys
import os
from datetime import datetime, timedelta
import calendar
from whitechapel.settings import production

# Set up script backup variables - working directory to the script's path, the day, what media directory, database & database user

os.chdir(os.path.dirname(sys.argv[0]))
db_name = production.DATABASES['default']['NAME']
today = datetime.now().date()
media_dir = 'media/'

def backup_website(date):
	"""Back up the database"""
	# Construct the backup path depending on what day it is. Sunday = weekly backup, last day of month = monthly backup, 31st January = annual backup, otherwise daily backup
	if date.isoweekday() == 7:
		path = 'backups/weekly/' + date.isoformat()
	elif date.day == calendar.monthrange(date.year, date.month)[1]:
		path = 'backups/monthly/' + str(date.month)
	elif date.day == 31 and date.month == 12:
		path = 'backups/annual/' + str(date.year)
	else:
		path = 'backups/daily/' + date.isoformat()

	# Create the path
	if os.path.exists(path) == False:
		os.makedirs(path)

	# Create the filenames
	sql_filename = today.isoformat() + '_whitechapel_db.sql'
	media_filename = today.isoformat() + '_whitechapel_media.tar.gz'

	# Ackshully do the backup
	os.system('sudo -u postgres pg_dump --no-acl --no-owner ' + db_name + ' > ' + path + '/' + sql_filename)
	os.system('tar -cvzf ' + path + '/' + media_filename + ' ' + media_dir)


def clean_backup_directory(date, clean_type):
	"""Delete files older than 7 days for daily backups, older than one month for weekly backups, and older than a year for monthly backups. Keep annual backups indefinitely."""
	# Register current backup paths

	if clean_type == 'daily':
		path = 'backups/daily/'
		delta = 7
	elif clean_type == 'weekly':
		path = 'backups/weekly/'
		delta = 30
	elif clean_type == 'monthly':
		path = 'backups/monthly/'
		delta = 365

	# Delete everything older than a particular delta in the given path
	if os.path.exists(path):
		for directory in os.listdir(path):
			abspath = os.path.join(path, directory)
			max_age = date - timedelta(days=delta)
			if os.path.isdir(abspath) == True:
				# Empty the directories, should each file be older than the delta
				for file in os.listdir(abspath):
					filepath = os.path.join(abspath, file)
					if datetime.fromtimestamp(os.stat(filepath).st_mtime).date() <= max_age:
						os.remove(filepath)
				# If the directories are older than the delta, then delete them as well
				if datetime.fromtimestamp(os.stat(abspath).st_mtime).date() <= max_age:
						os.rmdir(abspath)

backup_website(today)
clean_backup_directory(today, 'daily')
clean_backup_directory(today, 'weekly')
clean_backup_directory(today, 'monthly')
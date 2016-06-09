#!/bin/bash

# Script that creates backups of the SoL Whitechapel Database and Media Library. Probably a good idea to put this in your crontab in production. Fill in your own settings!

CURRENT_DATE=$(date +'%Y-%m-%d')
DB_BACKUP_DIR=backups/databases
MEDIA_DIR=media
MEDIA_BACKUP_DIR=backups/media
DATABASE=

DB_FILENAME=${DB_BACKUP_DIR}/${DATABASE}_${CURRENT_DATE}.sql
MEDIA_FILENAME=${MEDIA_BACKUP_DIR}/media_${CURRENT_DATE}.tar.gz

echo "Backing up $DATABASE"

sudo -u postgres pg_dump --no-acl --no-owner ${DATABASE} > ${DB_FILENAME}

echo "Done! Now backing up media files"

tar -cvzf ${MEDIA_FILENAME} ${MEDIA_DIR}

echo "Complete!"
#!/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP.sql && \
export AWS_ACCESS_KEY_ID=AKIAYMFBS2D5IQDIPGX2 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \

aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP.sql

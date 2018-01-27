#!/bin/bash

MAX_BACKUPS=7
BACKUP_NAME=$(date +\%Y.\%m.\%d.\%H\%M\%S).sql
BACKUP_FOLDER=/backup

echo "=> Backup started: ${BACKUP_NAME}"
if mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD} --default-character-set=utf8mb4 acorn_production > ${BACKUP_FOLDER}/${BACKUP_NAME}; then
    echo "   Backup succeeded"
else
    echo "   Backup failed"
    rm -rf ${BACKUP_FOLDER}/${BACKUP_NAME}
fi

if [ -n "${MAX_BACKUPS}" ]; then
    while [ $(ls ${BACKUP_FOLDER} -N1 | wc -l) -gt ${MAX_BACKUPS} ];
    do
        BACKUP_TO_BE_DELETED=$(ls ${BACKUP_FOLDER} -N1 | sort | head -n 1)
        echo "   Backup ${BACKUP_TO_BE_DELETED} is deleted"
        rm -rf ${BACKUP_FOLDER}/${BACKUP_TO_BE_DELETED}
    done
fi

echo "=> Backup done"

#!/bin/bash

DOCKER_ID="minecraft_server_1.1.0"
TODAY=$(date +%F-%T)
SERVER_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORLD_DIRECTORY="$SERVER_DIRECTORY/workdir/world"
BACKUP_DIRECTORY="$SERVER_DIRECTORY/backup/"
ARCHIVE_NAME="${DOCKER_ID}_$TODAY"
BORG_BINARY="$SERVER_DIRECTORY/borg-centos6-64"

echo "/say Achtung. Der Server stoppt in 60 Sekunden für das tägliche Backup" | docker attach $DOCKER_ID
sleep 60
echo "/stop" | docker attach $DOCKER_ID

$BORG_BINARY create --stats $BACKUP_DIRECTORY::$ARCHIVE_NAME $WORLD_DIRECTORY
docker start $DOCKER_ID
$BORG_BINARY prune -d 7 -w 4 -m 12 $BACKUP_DIRECTORY

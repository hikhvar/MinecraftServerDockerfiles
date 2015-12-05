#!/bin/bash

SERVER_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MINECRAFT_USER="minecraft"
MINECRAFT_GROUP="minecraft"

#### Don't change anything below this ####

WORLD_DIRECTORY="$SERVER_DIRECTORY/workdir/world"
BACKUP_DIRECTORY="$SERVER_DIRECTORY/backup/"
BORG_BINARY="$SERVER_DIRECTORY/borg-centos6-64"

cd "$SERVER_DIRECTORY"
mkdir -p "$BACKUP_DIRECTORY"
mkdir -p "$WORLD_DIRECTORY"
sudo chown -R $MINECRAFT_USER:$MINECRAFT_GROUP $WORLD_DIRECTORY
$BORG_BINARY init "$BACKUP_DIRECTORY"

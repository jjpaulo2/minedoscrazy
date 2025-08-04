#!/usr/bin/env bash

set -euo pipefail;

BACKUP_DIR="backups";
DATA_DIR="data";
TIMESTAMP="$(date +%Y%m%d-%H%M%S)";
BUCKET=$(cat .bucket);

mkdir -p "./$BACKUP_DIR";

echo "[$(date)] Creating backup...";

cp -r "./$DATA_DIR" "./$BACKUP_DIR/data-$TIMESTAMP";
cd "./$BACKUP_DIR/data-$TIMESTAMP";
zip -r "../../data-$TIMESTAMP.zip" ".";
cd "../..";

echo "[$(date)] Uploading backup to S3...";

aws s3 cp "./$BACKUP_DIR/data-$TIMESTAMP.zip" "s3://$BUCKET/data-$TIMESTAMP.zip";

echo "[$(date)] Cleaning backup folder...";

find "$BACKUP_DIR" -mindepth 1 -delete;

echo "[$(date)] Backup completed successfully.";

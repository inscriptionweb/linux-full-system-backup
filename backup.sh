#!/bin/bash

# WARNING: This script is provided without any warranty.  Use this at
# your own risk.  Improper use can destroy a system instantly.

# The directory in which the full OS backup can be stored - be sure it falls
# within an excluded directory, or add your own exclusion
# e.g.:
# BACKUPDIR='/media/backups'
BACKUPDIR='/media/backups'

# The directory in which the full OS backup will be archived.
# e.g.:
# ARCHIVEDIR='/media/archives'
ARCHIVEDIR='/media/archives'

echo "Starting backup..."
sync

echo "rsyncing / into ${BACKUPDIR} ..."
rsync -aAX --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / ${BACKUPDIR}
sync

echo "rsync complete and synced. Tarring..."
tar zcf ${ARCHIVEDIR}/system-backup-$(date -u -I'minutes' | cut -d+ -f1).tar.gz ${BACKUPDIR}
sync

echo "tar complete and synced."
ls -alhSr ${ARCHIVEDIR}/system-backup-*.tar.gz

echo "Backup completed."

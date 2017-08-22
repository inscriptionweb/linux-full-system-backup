#!/bin/bash

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
echo "rsyncing / into ${BACKUPDIR}/ ..."
rsync -aAX --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / ${BACKUPDIR}/
sync
echo "rsync complete and synced.  Tarring..."
tar zcf ${ARCHIVEDIR}/backup-$(date -u -I'minutes' | cut -d+ -f1).tar.gz ${BACKUPDIR}/
sync
echo "Archive complete; all pending writes synced.  Current backups:"
ls -alhSr ${ARCHIVEDIR}/*.tar.gz

This script is responsible for backing up the entire OS with exclusions and archiving the OS using tar.

This script can be expanded to use gzip, rar, pigz, etc. to compress the backup.


TODO:

* Custom excludes
* UTC vs. localtime
* Cron functionality (i.e. allow user to provide triggers to specify compression method, cores, nice/ionice priority)
* Email or notification function
* Output to stderr
* Omit tar error messaging for sockets/etc.

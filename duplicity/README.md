duplicity
=========

Duplicity backs directories by producing encrypted tar-format volumes and
uploading them to a remote or local file server. Because duplicity uses
librsync, the incremental archives are space efficient and only record the
parts of files that have changed since the last backup. Because duplicity uses
GnuPG to encrypt and/or sign these archives, they will be safe from spying
and/or modification by the server.

Samples
-------
```
include duplicity
```
```
duplicity::job { 'backup124':
  source => '/var/host/default',
  $destination = 'scp://badmin@other.host//usr/backup',
  $options = 'full --exclude /tmp',
  $runas = 'root',
  $minute = '30'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

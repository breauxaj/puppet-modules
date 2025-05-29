mariadb
=======

First revision, just adds the repo and installs the server and client packages.

Samples
-------
```
include mariadb
include mariadb::server
include mariadb::cluster
```
```
mariadb::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

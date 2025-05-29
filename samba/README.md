samba
=====

Samba provides secure, stable and fast file and print services for all clients
using the SMB/CIFS protocol, such as all versions of DOS and Windows, OS/2,
Linux and many others.

Samples
-------
```
include samba
```
```
samba::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

stash
=====

Atlassian Stash is an enterprise git server. This module does not provide the
application stack, just the management of the instance.

Samples
-------
```
include stash
```
```
stash::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

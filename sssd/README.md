sssd
====

SSSD is a system daemon. Its primary function is to provide access to identity
and authentication remote resource through a common framework that can provide
caching and offline support to the system. It provides PAM and NSS modules, and
in the future will D-BUS based interfaces for extended user information. It
provides also a better database to store local users as well as extended user
data.

Samples
-------
```
include sssd
```
```
class { 'sssd':
  ensure => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
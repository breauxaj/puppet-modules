mod_auth_xradius
================

Radius auth module for Apache.

Samples
-------
```
include modauthxradius
```
```
class { 'modauthxradius':
  ensure => 'latest'
}
```
```
class { 'modauthxradius':
  cachetype = 'memcache "127.0.0.1 10.0.0.10 10.0.0.11 10.0.0.11:11212"',
  cachetimeout = '600',
  ensure => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

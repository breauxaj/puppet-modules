realm
=====

Simple module to assign and retrieve an assigned fact. Also wrapper classes
for hiera lookups and assignment of users, groups, ssh keys, sudo, postfix,
rsyslog, sysctl and ssh server settings.

Samples
-------
```
class { 'realm':
  label: 'datacenter2'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

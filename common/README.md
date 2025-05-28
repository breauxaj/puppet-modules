common
======

The absolute base tasks that need to be applied to all hosts. Anything specific
should live in it's own module. This modules enforces the presence of some
packages.

Samples
-------
```
include common
```
```
class { 'common':
  ensure => 'latest'
}
```

Hiera
-----

Review the hiera folder for samples of the usage.

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
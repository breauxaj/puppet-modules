php56w
======

An alternative installation of PHP from Webtatic. Works with RHEL6 and RHEL7,
plus derivatives.

https://webtatic.com/packages/php56/

Samples
-------
```
include php56w
```
```
php56w::config {
  'Date/date.timezone': value => 'America/New_York';
}
```
```
php56w::modules { 'bcmath': ensure => 'latest', }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
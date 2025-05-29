php55w
======

An alternative installation of PHP from Webtatic. Works with RHEL6 and RHEL7,
plus derivatives.

https://webtatic.com/packages/php55/

Samples
-------
```
include php55w
```
```
php55w::config {
  'Date/date.timezone': value => 'America/New_York';
}
```
```
php55w::modules { "bcmath": ensure => 'latest', }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
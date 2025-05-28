php56
=====

An alternative installation of PHP for Amazon AMI.

Samples
-------
```
include php56
```
```
php56::config {
  'Date/date.timezone': value => 'America/New_York';
}
```
```
php56::modules { 'bcmath': ensure => 'latest', }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
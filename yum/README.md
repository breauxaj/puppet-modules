yum
===

A software package manager that installs, updates, and removes packages on
RPM-based systems. It automatically computes dependencies and figures out what
things should occur to install packages. yum makes it easier to maintain groups
of machines without having to manually update each one using rpm.

Samples
-------
```
include yum
```
```
yum::config {
  "exclude": value => 'kernel*';
}
```
```
yum::gpgkey { 'somerepo':
  location => '',
  content  => ''
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
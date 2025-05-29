fluentd
=======

Fluentd is an open source data collector for unified logging layer. Fluentd
allows you to unify data collection and consumption for a better use and
understanding of data.

Notes
-----

Module does not attempt to manage the configuration in this version but does
subscribe to the main configuration file to enable service synchronization.

Samples
-------
```
include fluentd
```
```
fluentd::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

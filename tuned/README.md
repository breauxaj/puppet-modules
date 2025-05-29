tuned
=====

tuned is a system service that lets you select a tuning profile from one of the
nine profiles shipped with Red Hat Enterprise Linux 6, or any that you've
written yourself. Tuning profiles include sysctl settings (/proc/sys/), settings
for disk-elevators, power management options, transparent hugepages, and any
scripts that you might want to add yourself.

http://servicesblog.redhat.com/2012/04/16/tuning-your-system-with-tuned/

Samples
-------
```
include tuned
```
```
tuned::profile { 'off': }
```
```
tuned::profile { 'throughput-performance': }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

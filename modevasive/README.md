modevasive
==========

mod_evasive is an evasive maneuvers module for Apache to provide evasive action
in the event of an HTTP DoS or DDoS attack or brute force attack. It is also
designed to be a detection and network management tool, and can be easily
configured to talk to firewalls, routers, etc. mod_evasive presently reports
abuses via email and syslog facilities.

Samples
-------
```
include modevasive
```
```
class { 'modevasive':
  version => 'latest'
}
```
```
modevasive::config {
  doshashtablesize => '3097',
  dospagecount => '2',
  dossitecount => '50',
  dospageinterval => '1',
  dossiteinterval => '1'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
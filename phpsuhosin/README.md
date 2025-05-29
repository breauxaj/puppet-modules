phpsuhosin
==========

Suhosin (pronounced 'su-ho-shin') is an advanced protection system for PHP
installations. It was designed to protect servers and users from known and
unknown flaws in PHP applications and the PHP core. Suhosin comes in two
independent parts, that can be used separately or in combination. The first part
is a small patch against the PHP core, that implements a few low-level
protections against buffer overflows or format string vulnerabilities and the
second part is a powerful PHP extension that implements numerous other
protections.

Samples
-------
```
include phpsuhosin
```
```
phpsuhosin::config {
  "suhosin.simulation":      value => 'Off';
  "suhosin.session.encrypt": value => 'On';
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

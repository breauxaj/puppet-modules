lighttpd
========

lighttpd is a secure, fast, compliant, and very flexible web-server that has
been optimized for high-performance environments. It has a very low memory
footprint compared to other webservers and takes care of cpu-load. Its advanced
feature-set (FastCGI, CGI, Auth, Output-Compression, URL-Rewriting and many
more) make lighttpd the perfect webserver-software for every server that suffers
load problems.

Samples
-------
```
include lighttpd
```
```
lighttpd::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

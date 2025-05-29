rsyslog
=======

Rsyslog is an enhanced syslogd supporting, among others, MySQL, PostgreSQL,
failover log destinations, syslog/tcp, fine grain output format control, high
precision timestamps, queued operations and the ability to filter on any
message part.

Samples
-------
```
include rsyslog
```
```
rsyslog::rule { 'haproxy':
  filter      => 'local2.*',
  destination => '/var/log/haproxy.log',
}
```
```
rsyslog::rule { 'security':
  filter      => 'authpriv.*;auth.info',
  destination => '@192.168.1.1:515',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

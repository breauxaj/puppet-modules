phpredis
========

PHP extension for interfacing with Redis

Samples
-------
```
include phpredis
```
```
phpredis::config {
  "session.save_handler": value => 'redis';
  "session.save_path":    value => 'tcp://host1:6379?weight=1, tcp://host2:6379?weight=2';
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

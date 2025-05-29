modssl
======

This module provides SSL v2/v3 and TLS v1 support for the Apache HTTP Server.
It was contributed by Ralf S. Engeschall based on his mod_ssl project and
originally derived from work by Ben Laurie.

Samples
-------
```
include modssl
```
```
class { 'modssl':
  ensure => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

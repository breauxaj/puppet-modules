solr
====

Solr is a standalone enterprise search server with a REST-like API.

Samples
-------
```
include solr
```
```
solr::service { 'default': ensure => running, enable => true }
```
```
solr::config {
  "SOLR_HOME":    value => '/var/solr';
  "SOLR_PID_DIR": value => '/var/run';
  "SOLR_PORT":    value => 8983;
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

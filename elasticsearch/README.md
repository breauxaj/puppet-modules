elasticsearch
=============

Elasticsearch is a search server based on Lucene. It provides a distributed,
multitenant-capable full-text search engine with a RESTful web interface and
schema-free JSON documents. 

Samples
-------
```
include elasticsearch
```
```
class { 'elasticsearch':
  version => '1.7'
}
```
```
elasticsearch::config { 'default':

}
```
```
elasticsearch::logging { 'default':

}
```
```
elasticsearch::sysconfig {
  'ES_HEAP_SIZE':   value => '3g';
  'MAX_MAP_COUNT':  value => '262144';
}
```
```
elasticsearch::service { 'default':
  ensure => running,
  enable => true
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

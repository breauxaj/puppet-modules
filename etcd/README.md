etcd
====

etcd is an open-source distributed key value store that provides shared
configuration and service discovery for CoreOS clusters. etcd runs on each
machine in a cluster and gracefully handles master election during network
partitions and the loss of the current master.

Samples
-------
```
include etcd
```
```
etcd::config {
  'ETCD_NAME':                  value => 'default';
  'ETCD_DATA_DIR':              value => '/var/lib/etcd/default.etcd';
  'ETCD_LISTEN_CLIENT_URLS':    value => 'http://localhost:2379';
  'ETCD_ADVERTISE_CLIENT_URLS': value => 'http://localhost:2379';
}
```

Hiera
-----

Review the hiera folder for samples of the usage.

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
phpapc
======

Alternative PHP Cache is a free, open source (PHP license) framework that caches
the output of the PHP bytecode compiler in shared memory, thus reducing parsing
and disk I/O overhead for later requests; and a shared memory cache for user
data.

Samples
-------
```
include phpapc
```
```
phpapc::config {
  "apc.shm_size":       value => '384M';
  "apc.num_files_hint": value => '10000';
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

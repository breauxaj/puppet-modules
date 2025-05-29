gluster
=======

GlusterFS is an open source, distributed file system capable of scaling to
several petabytes (actually, 72 brontobytes!) and handling thousands of clients.
GlusterFS clusters together storage building blocks over Infiniband RDMA or
TCP/IP interconnect, aggregating disk and memory resources and managing data in
a single global namespace. GlusterFS is based on a stackable user space design
and can deliver exceptional performance for diverse workloads.

Samples
-------
```
include gluster
```
```
gluster::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

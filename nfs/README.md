nfs
===

Network File System (NFS) is a distributed file system protocol allowing a user
on a client computer to access files over a network much like local storage is
accessed. 

Samples
-------
```
include nfs
```
```
nfs::client::config { 'default': defaultvers => '3' }
```
```
nfs::client::mount { 'default':
  mount   => '/export/sample',
  device  => 'nfs:/export/sample',
  options => 'nolock,ro',
  atboot  => 'true'
}
```
```
nfs::client::service { 'default': ensure => running, enable => true }
```
```
nfs::server::exports { 'default':
  exports => [
    '/export/sample 192.168.208.5(ro)',
    '/export/another 192.168.208.10(ro) 192.168.208.11(ro)'
  ]
}
```
```
nfs::server::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

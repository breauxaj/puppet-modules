apache
======

The Apache HTTP Server Project is a collaborative software development effort
aimed at creating a robust, commercial-grade, featureful, and freely-available
source code implementation of an HTTP (Web) server.

Adding
------

To utilize the module, you must add it to your Puppet installation like so:
```
git clone git://github.com/breauxaj/puppet-apache.git modules/apache
```

Samples
-------
```
include apache
```
```
apache::service { 'default': ensure => running, enable => true }
```
```
apache::sysconfig { 'default':
  model   => 'worker',
  options => [ 'PHP', 'DRUPAL' ],
  lang    => 'en_US.UTF-8',
  pidfile => '/var/run/httpd.pid',
}
```
```
apache::config { 'default':
  servertokens => 'Prod',
  keepalive => 'On',
  maxkeepaliverequests => '200',
  listen => [ '80', '8080' ]
  serveradmin => 'webmaster@domain.com',
  serversignature => 'Off',
  namevirtualhost => [ '*:80', '127.0.0.1:8080' ],
}
```
```
apache::virtual { 'default':
  $documentroot = '/var/vhost/default',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

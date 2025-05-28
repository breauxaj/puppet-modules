sudo
====

Control the /etc/sudoers file, specifically to make sure that the include of 
the contents of /etc/sudoers.d is enabled. The sudo::rule define creates files
in the /etc/sudoers.d folder.

Samples
-------
```
include sudo
```
```
sudo::rule { 'admin':
  ensure   => present,
  priority => '000',
  rules    => '%admin    ALL=(ALL)    NOPASSWD: ALL',
}
```
```
sudo::rule { 'httpd':
  ensure   => present
  priority => '993',
  rules    => 'Cmnd_Alias HTTPD = /sbin/service httpd *, /etc/init.d/httpd *'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

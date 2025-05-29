htpasswd
========

htpasswd is used to create and update the flat-files used to store usernames
and password for basic authentication of HTTP users.

Samples
-------
```
include htpasswd
```
```
htpasswd::add_user { 'sample':
  password   => 'sample',
  filename   => '/etc/httpd/secure/sample',
  encryption => 'sha'
}
```
```
htpasswd::del_user { 'sample':
  filename => '/etc/httpd/secure/sample'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

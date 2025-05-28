ssh
===

OpenSSH is a FREE version of the SSH connectivity tools that technical users of
the Internet rely on.

Samples
-------
```
include ssh
```
```
ssh::config {
  "Port":             value => '22';
  "LogLevel":         value => 'VERBOSE';
  "LoginGraceTime":   value => '30';
  "PermitRootLogin":  value => 'yes';
  "StrictModes":      value => 'yes';
  "MaxAuthTries":     value => '6';
  "X11Forwarding":    value => 'yes';
  "UseDNS":           value => 'no';
  "Banner":           value => '/etc/issue.net';
}
```

Hiera
-----
```
ssh::config:
  'Banner':
    value: '/etc/issue.net'
  'LoginGraceTime':   
    value: '30'
  'MaxAuthTries':
    value: '6'
  'StrictModes':
    value: 'yes'
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
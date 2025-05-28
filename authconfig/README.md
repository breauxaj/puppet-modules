authconfig
==========

authconfig provides a simple method of configuring /etc/sysconfig/network to
handle NIS, as well as /etc/passwd and /etc/shadow, the files used for shadow
password support. Basic LDAP, Kerberos 5, and Winbind client configuration is
also provided.

Adding
------

To utilize the module, you must add it to your Puppet installation like so:
```
git clone git://github.com/breauxaj/puppet-authconfig.git modules/authconfig
```

Samples
-------
```
include authconfig
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

fail2ban
========

Fail2ban scans log files (e.g. /var/log/apache/error_log) and bans IPs that
show the malicious signs -- too many password failures, seeking for exploits,
etc. Generally Fail2Ban then used to update firewall rules to reject the IP
addresses for a specified amount of time, although any arbitrary other action
(e.g. sending an email, or ejecting CD-ROM tray) could also be configured. Out
of the box Fail2Ban comes with filters for various services (apache, courier,
ssh, etc).

Samples
-------
```
include fail2ban
```
```
fail2ban::service { 'default': ensure => running, enabled => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

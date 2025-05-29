ngircd
======

ngIRCd is a free, portable and lightweight Internet Relay Chat server for small
or private networks.

Samples
-------
```
include ngircd
```
```
ngircd::service { 'default': ensure => running, enable => true }
```
Define the operators array
```
$operators = {
  o1 => { oper_name => 'TheOper',
          oper_pass => 'ThePwd',
          oper_mask => '*!ident@somewhere.example.com',
        },
}
```
Define the servers array
```
$servers = {
  s1 => { server_name => 'irc2.the.net',
          server_host => 'connect-to-host.the.net',
          server_bind => '10.0.0.1',
          server_port => '6667',
          server_mypassword => 'MySecret',
          server_peerpassword => 'PeerSecret',
          server_group => '123',
          server_passive => 'no',
        },
}
```
Define the channels array
```
$channels = {
  c1 => { channel_name => '#TheName',
          channel_topic => 'a great topic',
          channel_modes => 'tnk',
          channel_key => 'Secret',
          channel_maxusers => '23',
        },
}
```
```
ngircd::config { 'default':
  global_name => 'irc.the.net',
  global_info => 'Server Info Text',
  global_password => 'abc',
  global_admininfo1 => 'Description',
  global_admininfo2 => 'Location',
  global_adminemail => 'admin@irc.server',
  global_ports => [ '6667', '6668', '6669' ],
  global_listen => [ '127.0.0.1', '10.0.0.1' ],
  global_motdfile => '/etc/ngircd.motd',
  global_motdphrase => 'Hello World!',
  global_serveruid => 'ngircd',
  global_servergid => 'ngircd',
  global_chrootdir => '/var/empty',
  global_pidfile => '/var/run/ngircd/ngircd.pid',
  global_pingtimeout => 120,
  global_pongtimeout => 20,
  global_connectretry => 60,
  global_opercanusemode => 'no',
  global_operservermode => 'no',
  global_predefchannelsonly => 'no',
  global_nodns => 'no',
  global_connectipv6 => 'no',
  global_connectipv4 => 'yes',
  global_maxconnections => '0',
  global_maxconnectionsip => '5',
  global_maxjoins => 10,
  global_maxnicklength => 9,
  operators => $operators,
  servers => $servers,
  channels => $channels,
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

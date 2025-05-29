define systemctl::reload {
  exec { '/usr/bin/systemctl daemon-reload':
    alias => 'systemctl',
  }
}
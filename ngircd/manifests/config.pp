define ngircd::config (
  $global_name,
  $global_info,
  $global_password,
  $global_admininfo1,
  $global_admininfo2,
  $global_adminemail,
  $global_ports,
  $global_listen,
  $global_motdfile,
  $global_motdphrase,
  $global_serveruid,
  $global_servergid,
  $global_chrootdir,
  $global_pidfile,
  $global_pingtimeout,
  $global_pongtimeout,
  $global_connectretry,
  $global_opercanusemode,
  $global_operservermode,
  $global_predefchannelsonly,
  $global_nodns,
  $global_connectipv6,
  $global_connectipv4,
  $global_maxconnections,
  $global_maxconnectionsip,
  $global_maxjoins,
  $global_maxnicklength,
  $operators,
  $servers,
  $channels
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'ngircd',
  }

  file { '/etc/ngircd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ngircd/ngircd.erb'),
    notify  => Service[$service],
  }
}

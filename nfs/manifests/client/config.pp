define nfs::client::config (
  $defaultvers = ''
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/nfsmount.conf',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nfs/nfsmount.erb'),
  }

}

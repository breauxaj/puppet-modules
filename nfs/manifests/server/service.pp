define nfs::server::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nfs',
      'nfslock',
      'rpcbind'
    ],
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

define nfs::client::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'netfs',
      'rpcbind'
    ],
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

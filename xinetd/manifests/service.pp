define xinetd::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'xinetd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

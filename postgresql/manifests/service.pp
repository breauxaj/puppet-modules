define postgresql::service (
  $ensure = running,
  $enable = true
) {
  include ::postgresql::server

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'postgresql',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

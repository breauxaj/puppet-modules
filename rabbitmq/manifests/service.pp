define rabbitmq::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'rabbitmq-server',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

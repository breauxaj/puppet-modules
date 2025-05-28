define authconfig::sssd::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'sssd',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => Package['sssd'],
  }

}

define ngircd::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'ngircd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

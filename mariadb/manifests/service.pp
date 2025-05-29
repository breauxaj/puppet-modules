define mariadb::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysql',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}

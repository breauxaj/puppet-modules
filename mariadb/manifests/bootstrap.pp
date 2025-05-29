define mariadb::bootstrap (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysql',
  }

  service { $service:
    start  => '/etc/init.d/mysql bootstrap',
    ensure => $ensure,
    enable => $enable,
  }

}

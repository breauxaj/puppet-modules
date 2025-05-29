class mariadb::cluster (
  $ensure = 'installed'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'MariaDB-Galera-server',
      'galera'
    ]
  }

  $removed = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysql-server',
  }

  package { $removed:
    ensure => absent,
    before => Package[$required],
  }

  package { $required:
    ensure  => installed,
    require => Yumrepo['mariadb'],
  }

}

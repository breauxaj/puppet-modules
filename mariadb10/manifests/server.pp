class mariadb10::server (
  $ensure = 'latest'
){
  include ::mariadb10

  package { $::mariadb10::params::mariadb_server_package:
    ensure  => $ensure,
    require => Yumrepo['mariadb'],
  }

  service { $::mariadb10::params::mariadb_service:
    ensure  => running,
    enable  => true,
    require => Package[$::mariadb10::params::mariadb_server_package],
  }

}

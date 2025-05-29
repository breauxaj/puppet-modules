class profile::sql::mariadb {
  include ::mariadb

  $mariadb_bootstrap = hiera('mariadb::bootstrap',{})

  mariadb::bootstrap { 'default':
    ensure => $mariadb_bootstrap['ensure'],
    enable => $mariadb_bootstrap['enable'],
  }

  $mariadb_service = hiera('mariadb::service',{})

  mariadb::service { 'default':
    ensure => $mariadb_service['ensure'],
    enable => $mariadb_service['enable'],
  }

}

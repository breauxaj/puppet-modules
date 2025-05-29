class profile::sql::postgresql {
  hiera_include('profile::sql::postgresql', '')

  $pgsql_service = hiera('postgresql::service',{})

  postgresql::service { 'default':
    ensure => $pgsql_service['ensure'],
    enable => $pgsql_service['enable'],
  }

}

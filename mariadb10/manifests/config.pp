define mariadb10::config (
  $value
) {
  include ::mariadb10

  $key = $title

  $config = '/etc/my.cnf.d/server.cnf'

  augeas { "server_cnf/${key}":
    lens    => 'PHP.lns',
    incl    => $config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::mariadb10::params::mariadb_server_package],
    notify  => Service[$::mariadb10::params::mariadb_service],
  }

}

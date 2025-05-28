define redis::config (
  $value
) {
  include ::redis

  $key = $title

  augeas { "redis_conf/${key}":
    lens    => 'Spacevars.simple_lns',
    incl    => $::redis::params::redis_config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::redis::params::redis_service],
    require => Package[$::redis::params::redis_package]
  }
}

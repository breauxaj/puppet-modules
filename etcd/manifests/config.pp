define etcd::config (
  $value
) {
  include ::etcd

  $key = $title

  augeas { "etcd_conf/${key}":
    lens    => 'Shellvars.lns',
    incl    => $::etcd::params::etcd_config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::etcd::params::etcd_package],
    notify  => Service[$::etcd::params::etcd_service],
  }

}

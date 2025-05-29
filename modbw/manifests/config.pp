define modbw::config (
  $origin
) {
  include ::modbw

  file { $::modbw::params::modbw_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modbw/config.erb'),
    require => Package[$::modbw::params::modbw_package],
  }

}

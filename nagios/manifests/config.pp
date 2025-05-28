define nagios::config (
  $content
) {
  include ::nagios

  file { $::nagios::params::nagios_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => $content,
    notify  => Service[$::nagios::params::nagios_service],
    require => Package[$::nagios::params::nagios_package]
  }

}

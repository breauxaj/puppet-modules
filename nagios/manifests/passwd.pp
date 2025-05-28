define nagios::passwd (
  $content
) {
  include ::nagios

  file { $::nagios::params::nagios_passwd:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => $content,
    require => Package[$::nagios::params::nagios_package]
  }

}

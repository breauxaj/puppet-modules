define systemd::unit (
  $content
) {
  include ::systemd

  file { "${::systemd::params::systemd_unit_path}/${name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
    require => Package[$::systemd::params::systemd_package]
  } ~> Exec['systemctl-daemon-reload']

}

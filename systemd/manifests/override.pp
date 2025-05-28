define systemd::override (
  $content
) {
  include ::systemd

  file { "${::systemd::params::systemd_override_path}/${name}":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755'
  }

  file { "${::systemd::params::systemd_override_path}/${name}/override.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
    require => [
      File["${::systemd::params::systemd_override_path}/${name}"],
      Package[$::systemd::params::systemd_package]
    ]
  } ~> Exec['systemctl-daemon-reload']

}

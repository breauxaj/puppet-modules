define ssh::config (
  $value
) {
  include ::ssh

  $key = $title

  augeas { "sshd_config/${key}":
    context => $::ssh::params::ssh_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::ssh::params::ssh_service],
    require => Package[$::ssh::params::ssh_packages]
  }

}

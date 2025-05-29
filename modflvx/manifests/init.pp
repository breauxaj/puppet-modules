class modflvx (
  $ensure = 'latest'
) inherits ::modflvx::params {
  package { $::modflvx::params::modflvx_package:
    ensure  => $ensure,
  }

  file { $::modflvx::params::modflvx_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modflvx/flvx.erb'),
  }

  notify { 'flvx_on_httpd_version':
    message => ">>> flvx_on_httpd_version is '${::flvx_on_httpd_version}'"
  }

}

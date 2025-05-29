class modperl (
  $ensure = 'latest'
) inherits ::modperl::params {
  package { $::modperl::params::modperl_packages:
    ensure  => $ensure,
  }

  file { $::modperl::params::modperl_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modperl/config.erb'),
  }

  notify { 'perl_on_httpd_version':
    message => ">>> perl_on_httpd_version is '${::perl_on_httpd_version}'"
  }

}

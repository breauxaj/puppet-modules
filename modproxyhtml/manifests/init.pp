class modproxyhtml (
  $ensure = 'latest'
) inherits ::modproxyhtml::params {
  package { $::modproxyhtml::params::modproxyhtml_package:
    ensure  => $ensure,
  }

  file { $::modproxyhtml::params::modproxyhtml_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modproxyhtml/config.erb'),
  }

  notify { 'ph_on_httpd_version':
    message => ">>> ph_on_httpd_version is '${::ph_on_httpd_version}'"
  }

}

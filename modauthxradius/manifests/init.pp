class modauthxradius (
  $cachetype = '',
  $cachetimeout = '',
  $ensure = 'latest'
) inherits ::modauthxradius::params {
  package { $::modauthxradius::params::modauthxradius_package:
    ensure  => $ensure,
  }

  file { $::modauthxradius::params::modauthxradius_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modauthxradius/radius.erb'),
  }

  notify { 'radius_on_httpd_version':
    message => ">>> radius_on_httpd_version is '${::radius_on_httpd_version}'"
  }

}

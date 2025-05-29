class modgeoip (
  $ensure = 'latest'
) inherits ::modgeoip::params {
  package { $::modgeoip::params::modgeoip_packages:
    ensure  => $ensure,
  }

  file { $::modgeoip::params::modgeoip_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modgeoip/geoip.erb'),
  }

  notify { 'geoip_on_httpd_version':
    message => ">>> geoip_on_httpd_version is '${::geoip_on_httpd_version}'"
  }

}

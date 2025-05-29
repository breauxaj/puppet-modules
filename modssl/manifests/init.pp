class modssl (
  $ensure = 'latest'
) inherits ::modssl::params {
  package { $::modssl::params::modssl_package:
    ensure  => $ensure,
  }

  file { $::modssl::params::modssl_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modssl/ssl.erb'),
  }

  notify { 'ssl_on_httpd_version':
    message => ">>> ssl_on_httpd_version is '${::ssl_on_httpd_version}'"
  }

}

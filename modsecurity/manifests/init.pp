class modsecurity (
  $ensure = 'latest'
) inherits ::modsecurity::params {
  package { $::modsecurity::params::modsecurity_package:
    ensure  => $ensure,
  }

  file { $::modsecurity::params::modsecurity_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modsecurity/config.erb'),
  }

  notify { 'security_on_httpd_version':
    message => ">>> security_on_httpd_version is '${::security_on_httpd_version}'"
  }

}

class modwsgi (
  $ensure = 'latest'
) inherits ::modwsgi::params {
  package { $::modwsgi::params::modwsgi_package:
    ensure  => $ensure,
  }

  file { $::modwsgi::params::modwsgi_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modwsgi/config.erb'),
  }

  notify { 'wsgi_on_httpd_version':
    message => ">>> wsgi_on_httpd_version is '${::wsgi_on_httpd_version}'"
  }

}

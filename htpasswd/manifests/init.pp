class htpasswd {
  file { '/usr/bin/htpasswd':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['httpd'],
  }

}
node default {
  include ::php56

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  file { '/var/www/html/index.php':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '<?php phpinfo(); ?>',
    require => Package['httpd24']
  }

  package { 'httpd24': ensure => present }

  php56::config {
    'Date/date.timezone': value => 'America/New_York'
  }

  php56::modules { 'xmlrpc': }

}

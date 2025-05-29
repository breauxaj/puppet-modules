class php::mod::redis (
  $save_path = '',
  $serialize_handler = '',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'php-pecl-redis',
      'php-pecl-igbinary'
    ],
  }

  package { $required:
    ensure  => latest,
  }

  file { '/etc/php.d/redis.ini':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/mod/redis.erb'),
  }

  file { '/etc/php.d/igbinary.ini':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/mod/igbinary.erb'),
  }

}

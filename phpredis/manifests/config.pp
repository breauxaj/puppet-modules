define phpredis::config (
  $value
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'php-pecl-redis',
      'php-pecl-igbinary'
    ],
  }

  $key = $title

  $context = '/files/etc/php.d/redis.ini'

  augeas { "redis_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$required],
  }

}

define phpsuhosin::config (
  $value
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-suhosin' ],
  }

  $key = $title

  $context = '/files/etc/php.d/suhosin.ini'

  augeas { "suhosin_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$required],
  }

}

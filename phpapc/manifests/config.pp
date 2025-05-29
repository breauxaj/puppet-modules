define phpapc::config (
  $value
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-pecl-apc' ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'httpd' ],
  }

  $key = $title

  $context = '/files/etc/php.d/apc.ini'

  augeas { "apc_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$service],
    require => Package[$required],
  }

}

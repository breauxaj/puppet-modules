class phpapc {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-pecl-apc' ],
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php' ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'httpd' ],
  }

  package { $required:
    ensure  => latest,
    require => Package[$depends],
    notify  => Service[$service],
  }

}

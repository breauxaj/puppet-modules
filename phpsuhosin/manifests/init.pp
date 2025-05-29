class phpsuhosin {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-suhosin' ],
  }

  package { $required:
    ensure  => latest,
  }

}

class php::mod::mcrypt {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-mcrypt' ],
  }

  package { $required:
    ensure  => latest,
  }

}

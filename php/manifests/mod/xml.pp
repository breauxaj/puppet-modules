class php::mod::xml {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-xml' ],
  }

  package { $required:
    ensure  => latest,
  }

}

class php::mod::gd {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-gd' ],
  }

  package { $required:
    ensure  => latest,
  }

}

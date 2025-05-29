class php::mod::mbstring {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-mbstring' ],
  }

  package { $required:
    ensure  => latest,
  }

}

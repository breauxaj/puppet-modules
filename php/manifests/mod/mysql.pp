class php::mod::mysql {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-mysql' ],
  }

  package { $required:
    ensure  => latest,
  }

}

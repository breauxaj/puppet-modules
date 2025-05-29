class php::mod::codesniffer {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-pear-PHP-CodeSniffer' ],
  }

  package { $required:
    ensure  => latest,
  }

}

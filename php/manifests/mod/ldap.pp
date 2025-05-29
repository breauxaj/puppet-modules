class php::mod::ldap {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-ldap' ],
  }

  package { $required:
    ensure  => latest,
  }

}

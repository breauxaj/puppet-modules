class php::mod::memcached {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-pecl-memcached' ],
  }

  package { $required:
    ensure  => latest,
  }

}

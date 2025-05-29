class phpxhprof {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'php-pecl-xhprof',
      'xhprof',
    ],
  }

  package { $required:
    ensure  => latest,
  }

}

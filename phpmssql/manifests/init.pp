class phpmssql {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-mssql' ],
  }

  package { $required:
    ensure  => latest,
  }

}

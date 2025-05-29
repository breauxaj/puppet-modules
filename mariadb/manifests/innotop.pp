class mariadb::innotop (
  $ensure = 'installed'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'innotop',
  }

  package { $required: ensure  => $ensure }

}

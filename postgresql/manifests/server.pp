class postgresql::server (
  $ensure = 'latest'
){
  include ::postgresql

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'postgresql-server' ],
  }

  package { $required:
    ensure => $ensure
  }

}

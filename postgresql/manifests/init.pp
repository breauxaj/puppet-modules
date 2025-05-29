class postgresql (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'postgresql',
      'postgresql-pltcl'
    ],
  }

  package { $required:
    ensure => $ensure
  }

}

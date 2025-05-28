class apache::top (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'apachetop' ],
  }

  package { $required:
    ensure  => $ensure,
  }

}

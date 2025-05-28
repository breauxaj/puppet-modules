class authconfig (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'authconfig',
  }

  package { $required: ensure => $ensure }

}

class tuned (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tuned',
  }

  package { $required: ensure => $ensure }

}

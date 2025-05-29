class rabbitmq (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'rabbitmq-server' ],
  }

  package { $required: ensure => $ensure }

}

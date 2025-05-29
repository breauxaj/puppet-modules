class squid (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'squid',
  }

  package { $required: ensure => $ensure }

}

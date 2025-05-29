class samba (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'samba',
  }

  package { $required: ensure => $ensure }

}

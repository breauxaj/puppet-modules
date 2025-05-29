class repo (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'createrepo',
  }

  package { $required: ensure => $ensure }

}

class nfs (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nfs-utils',
      'rpcbind'
    ]
  }

  package { $required: ensure => latest }

}

class keepalived {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'keepalived',
  }

  package { $required: ensure => latest }

}

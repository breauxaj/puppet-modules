define samba::service (
  $ensure,
  $enable
) {
  $services = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'smb', 'nmb' ],
  }

  service { $services:
    ensure => $ensure,
    enable => $enable,
  }

}

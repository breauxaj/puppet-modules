define gluster::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'glusterd',
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'glusterfs-server' ],
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => Package[$depends],
  }

}

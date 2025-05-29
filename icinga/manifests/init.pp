class icinga {
  $distro = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'epel',
  }

  yumrepo { 'icinga':
    baseurl        => "http://packages.icinga.org/${distro}/${::lsbmajdistrelease}/release/",
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'http://packages.icinga.org/icinga.key',
    descr          => "Icinga (Stable Release for ${::osfamily} ${::lsbmajdistrelease})"
  }

}

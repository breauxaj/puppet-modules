class passenger {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mod_passenger',
  }

  yumrepo { 'passenger':
    baseurl        => "http://passenger.stealthymonkeys.com/rhel/${::lsbmajdistrelease}/${::hardwaremodel}",
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'http://passenger.stealthymonkeys.com/RPM-GPG-KEY-stealthymonkeys.asc',
    descr          => "Red Hat Enterprise ${::lsbmajdistrelease} - Phusion Passenger"
  }

  package { $required:
    ensure  => installed,
    require => [ Yumrepo['passenger'], Package['httpd'] ],
  }

  file { '/etc/httpd/conf.d/passenger.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('passenger/passenger.erb'),
    require => Package[$required]
  }

}

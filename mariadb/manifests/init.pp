class mariadb {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'MariaDB-client',
  }

  $removed = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysql',
  }

  $distro = $::operatingsystem ? {
    /(?i-mx:centos)/            => 'centos',
    /(?i-mx:fedora)/            => 'fedora',
    /(?i-mx:redhat|scientific)/ => 'rhel',
  }

  $proc = $::hardwaremodel ? {
    /(?i-mx:i686)/   => 'x86',
    /(?i-mx:x86_64)/ => 'amd64',
  }

  yumrepo { 'mariadb':
    baseurl        => "http://yum.mariadb.org/5.5/${distro}${::lsbmajdistrelease}-${proc}",
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
    descr          => 'MariaDB',
  }

  package { $removed:
    ensure => absent,
    before => Package[$required],
  }

  package { $required:
    ensure  => installed,
    require => Yumrepo['mariadb'],
  }

  file { '/usr/local/sbin/mysqltuner.pl':
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/mariadb/mysqltuner.pl',
  }

}

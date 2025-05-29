class fluentd {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'td-agent',
  }

  yumrepo { 'treasuredata':
    baseurl        => 'http://packages.treasuredata.com/2/redhat/$releasever/$basearch',
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'http://packages.treasuredata.com/GPG-KEY-td-agent',
    descr          => 'TreasureData',
  }

  package { $required:
    ensure  => installed,
    require => Yumrepo['treasuredata'],
  }

}

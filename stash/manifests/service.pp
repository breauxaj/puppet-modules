define stash::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'stash',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => File['/etc/init.d/stash'],
  }

  file { '/etc/init.d/stash':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/stash/stash.init'
  }

}

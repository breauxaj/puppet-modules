define nfs::server::exports (
  $exports = ''
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/exports',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nfs/exports.erb'),
  }

  exec { '/usr/sbin/exportfs -a':
    alias       => 'exportfs',
    refreshonly => true,
    subscribe   => File[$config],
  }

}

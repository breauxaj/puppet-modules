define stash::config (
  $runas = 'deploy',
  $catalina_home = '/usr/local/stash'
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'stash',
  }

  file { '/etc/sysconfig/stash':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('stash/sysconfig.erb'),
    notify  => Service[$service],
  }

  file { '/etc/profile.d/stash.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('stash/profile.erb'),
    notify  => Service[$service],
  }

}

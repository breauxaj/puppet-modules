define haproxy::config (
  $backends
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/haproxy/haproxy.cfg',
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'haproxy',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('haproxy/haproxy.erb'),
    notify  => Service[$service],
  }

}

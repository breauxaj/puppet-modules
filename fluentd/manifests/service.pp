define fluentd::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'td-agent',
  }

  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/td-agent/td-agent.conf',
  }

  service { $service:
    ensure    => $ensure,
    enable    => $enable,
    subscribe => File[$config],
  }

  file { $config:
    ensure => file,
  }

}

class phpfpm (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-fpm' ],
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/etc/php-fpm.d',
      '/var/log/php-fpm'
    ],
  }

  package { $required:
    ensure => $ensure
  }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}

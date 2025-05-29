define phpfpm::service (
  $ensure,
  $enable
) {
  include ::phpfpm

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'php-fpm',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}

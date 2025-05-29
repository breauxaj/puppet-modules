define phpfpm::modules (
  $ensure = 'latest'
){
  include ::phpfpm

  $required = $title

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-fpm' ],
  }

  package { $required:
    ensure  => $ensure,
    require => Package[$depends],
  }

}

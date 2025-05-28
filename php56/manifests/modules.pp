define php56::modules (
  $ensure = $::php56::params::php_package_ensure
) {
  include ::php56

  $required = $title

  package { "php56-${required}":
    ensure  => $ensure,
    require => Package[$::php56::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}

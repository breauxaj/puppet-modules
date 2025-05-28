define perl::modules (
  $ensure = $::perl::params::perl_package_ensure
) {
  include ::perl

  $required = $title

  package { $required:
    ensure  => $ensure,
    require => Package[$::perl::params::perl_package]
  }

}
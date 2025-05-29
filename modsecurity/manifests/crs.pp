class modsecurity::crs (
  $ensure = 'latest'
) inherits ::modsecurity::params {
  package { $::modsecurity::params::modsecurity_crs_package:
    ensure  => $ensure,
  }

}

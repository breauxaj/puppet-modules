class modbw (
  $ensure = 'latest'
) inherits ::modbw::params {
  package { $::modbw::params::modbw_package:
    ensure  => $ensure,
  }

}

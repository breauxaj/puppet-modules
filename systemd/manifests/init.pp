# Class: systemd
#
# This class installs the systemd package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the systemd package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'systemd':
#      ensure => 'latest'
#    }
#
class systemd (
  $ensure = $::systemd::params::systemd_package_ensure
) inherits ::systemd::params {
  package { $::systemd::params::systemd_package:
    ensure  => $ensure,
  }

  $over = hiera('systemd::override',{})
  create_resources('systemd::override',$over)

  $unit = hiera('systemd',{})
  create_resources('systemd::unit',$unit)

  $services = hiera_hash('services',{})
  create_resources('service',$services)

}

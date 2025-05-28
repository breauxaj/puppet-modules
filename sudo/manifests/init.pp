# Class: sudo
#
# This class manages the sudo package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Manage the sudo package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'sudo':
#      ensure => 'latest'
#    }
#
class sudo (
  $ensure = $::sudo::params::sudo_package_ensure
) inherits ::sudo::params {
  package { $::sudo::params::sudo_package:
    ensure  => $ensure,
  }

  $rules = hiera_hash('sudo',{})
  create_resources('sudo::rule',$rules)

}

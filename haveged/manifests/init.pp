# Class: haveged
#
# This class installs the haveged package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the haveged package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'haveged':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'haveged':
#      ensure => 'absent'
#    }
#
class haveged (
  $ensure = $::haveged::params::haveged_package_ensure
) inherits ::haveged::params {
  package { $::haveged::params::haveged_package:
    ensure  => $ensure,
  }

  service { $::haveged::params::haveged_service:
    ensure  => running,
    enable  => true,
    require => Package[$::haveged::params::haveged_package],
  }
}
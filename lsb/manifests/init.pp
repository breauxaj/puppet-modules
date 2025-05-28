# Class: lsb
#
# This class installs lsb packages
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the list of packages
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'lsb':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'lsb':
#      ensure => 'absent'
#    }
#
class lsb (
  $ensure = $::lsb::params::lsb_package_ensure
) inherits ::lsb::params {
  package { $::lsb::params::lsb_package:
    ensure  => $ensure,
  }

}

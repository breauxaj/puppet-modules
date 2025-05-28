# Class: devel
#
# This class installs certain development packages
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the list of packages
#
# Requires:
#
#  EPEL repository
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'devel':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'devel':
#      ensure => 'absent'
#    }
#
class devel (
  $ensure = 'latest'
) inherits ::devel::params {
  package { $::devel::params::devel_package:
    ensure  => $ensure,
  }

}

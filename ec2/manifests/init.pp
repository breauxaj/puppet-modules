# Class: ec2
#
# This class installs ec2 packages
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
#    class { 'ec2':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'ec2':
#      ensure => 'absent'
#    }
#
class ec2 (
  $ensure = $::ec2::params::ec2_package_ensure
) inherits ::ec2::params {
  package { $::ec2::params::ec2_packages:
    ensure  => $ensure,
  }

}

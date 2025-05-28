# Class: java7::devel
#
# This class installs the java jdk package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java jdk package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java7::devel':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'java7::devel':
#      ensure => 'absent'
#    }
#
class java7::devel (
  $ensure = $::java7::params::jdk_package_ensure
) inherits ::java7::params {
  package { $::java7::params::jdk_package:
    ensure  => $ensure,
  }

}

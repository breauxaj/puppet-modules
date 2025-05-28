# Class: java7
#
# This class installs the java jre package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java jre package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java7':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'java7':
#      ensure => 'absent'
#    }
#
class java7 (
  $ensure = $::java7::params::jre_package_ensure
) inherits ::java7::params {
  package { $::java7::params::jre_package:
    ensure  => $ensure,
  }

}

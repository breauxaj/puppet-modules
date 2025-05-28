# Class: java8
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
#    class { 'java8':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'java8':
#      ensure => 'absent'
#    }
#
class java8 (
  $ensure = $::java8::params::jre_package_ensure
) inherits ::java8::params {
  package { $::java8::params::jre_package:
    ensure  => $ensure,
  }

}

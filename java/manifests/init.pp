# Class: java
#
# This class installs the java package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java': }
#
#  To remove the installation, use:
#
#    class { 'java':
#      ensure => 'absent'
#    }
#
class java (
  $ensure = 'latest',
  $version = '7'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ "java-1.${version}.0-openjdk" ],
  }

  package { $required:
    ensure => $ensure
  }

}

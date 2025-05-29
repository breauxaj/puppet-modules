# Class: java::devel
#
# This class installs the java development package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java development package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java::devel': }
#
#  To remove the installation, use:
#
#    class { 'java::devel':
#      ensure => 'absent'
#    }
#
class java::devel (
  $ensure = 'latest',
  $version = '7'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ "java-1.${version}.0-openjdk-devel" ],
  }

  package { $required:
    ensure => $ensure
  }

  file { '/etc/profile.d/java.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/java/java.profile'
  }

}

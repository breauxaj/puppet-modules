# Class: haproxy
#
# This class installs the haproxy package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the haproxy package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'haproxy':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'haproxy':
#      ensure => 'absent'
#    }
#
class haproxy (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'haproxy',
  }

  package { $required: ensure => $ensure }

}

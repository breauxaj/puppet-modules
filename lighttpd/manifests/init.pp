# Class: lighttpd
#
# This class installs the lighttpd package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the lighttpd package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'lighttpd':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'lighttpd':
#      ensure => 'absent'
#    }
#
class lighttpd (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'lighttpd',
  }

  package { $required: ensure => $ensure }

}

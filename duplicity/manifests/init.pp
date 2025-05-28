# Class: duplicity
#
# This class installs duplicity
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the duplicity package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'duplicity':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'duplicity':
#      ensure => 'absent'
#    }
#
class duplicity (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'duplicity',
  }

  package { $required: ensure => $ensure }

}

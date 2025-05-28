# Class: erlang
#
# This class installs erlang packages
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
#    class { 'erlang':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'erlang':
#      ensure => 'absent'
#    }
#
class erlang (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'erlang' ],
  }

  package { $required: ensure => $ensure }

}

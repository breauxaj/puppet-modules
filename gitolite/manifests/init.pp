# Class: gitolite
#
# This class installs the gitolite package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the gitolite package
#
# Requires:
#
#  EPEL Repository
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'gitolite':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'gitolite':
#      ensure => 'absent'
#    }
#
class gitolite (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'gitolite3' ],
  }

  package { $required: ensure  => $ensure }

}

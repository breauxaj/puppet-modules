# Class: git
#
# This class installs the git package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the git package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'git':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'git':
#      ensure => 'absent'
#    }
#
class git (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'git',
  }

  package { $required: ensure => $ensure }

}

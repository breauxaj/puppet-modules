# Class: bind
#
# This class installs Bind name server
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the bind package
#
# Actions:
#   - Install Bind
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'bind':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'bind':
#      ensure => 'absent'
#    }
#
class bind (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'bind'
  }
  
  package { $required: ensure  => $ensure }
  
}

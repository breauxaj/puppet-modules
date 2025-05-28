# Class: bind::devel
#
# This class installs Bind name server devel package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the balance package
#
# Actions:
#   - Install Bind devel package
#   - Install Bind packages as dependency
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'bind::devel':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'bind::devel':
#      ensure => 'absent'
#    }
#
class bind::devel (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'bind-devel' ],
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'bind' ],
  }

  package { $required:
    ensure  => $ensure,
    require => Package[$depends],
  }

}

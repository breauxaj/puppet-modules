# Class: bind::chroot
#
# This class installs Bind chroot package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the bind chroot package
#
# Actions:
#   - Install Bind chroot package
#   - Install Bind package as dependency
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'bind::chroot':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'bind::chroot':
#      ensure => 'absent'
#    }
#
class bind::chroot (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'bind-chroot' ],
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'bind' ],
  }

  package { $required:
    ensure  => $ensure,
    require => Package[$depends],
  }

}

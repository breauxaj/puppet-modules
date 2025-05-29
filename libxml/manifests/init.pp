# Class: libxml
#
# This class installs the libxml2 package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the libxml2 package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'libxml2':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'libxml2':
#      ensure => 'absent'
#    }
#
class libxml (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'libxml2' ],
  }

  package { $required: ensure => $ensure }

  file { '/usr/lib64/libxml2.so':
    ensure => 'link',
    owner  => 'root',
    group  => 'root',
    target => '/usr/lib64/libxml2.so.2',
  }

}

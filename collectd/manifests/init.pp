# Class: collectd
#
# This class installs Collectd
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the collectd package
#
# Actions:
#   - Install Collectd
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'collectd':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'collectd':
#      ensure => 'absent'
#    }
#
class collectd (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'collectd',
  }

  package { $required: ensure => $ensure }

}

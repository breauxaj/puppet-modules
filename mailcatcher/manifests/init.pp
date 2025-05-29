# Class: mailcatcher
#
# This class installs Mailcatcher
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the mailcatcher package
#
# Actions:
#   - Install Mailcactcher
#
# Requires:
#
#  Rubygems
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'mailcatcher':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'mailcatcher':
#      ensure => 'absent'
#    }
#
class mailcatcher (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mailcatcher',
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'rubygems' ],
  }

  package { $required:
    ensure   => $ensure,
    provider => gem,
    require  => Package[$depends]
  }

}

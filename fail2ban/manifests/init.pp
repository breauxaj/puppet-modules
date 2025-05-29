# Class: fail2ban
#
# This class installs the fail2ban server
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the fail2ban package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'fail2ban':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'fail2ban':
#      ensure => 'absent'
#    }
#
class fail2ban (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'fail2ban',
  }

  package { $required: ensure => $ensure }

}

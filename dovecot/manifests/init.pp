# Class: dovecot
#
# This class installs the dovecot server
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the dovecot package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'dovecot':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'dovecot':
#      ensure => 'absent'
#    }
#
class dovecot (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dovecot',
  }

  package { $required: ensure => $ensure }

}

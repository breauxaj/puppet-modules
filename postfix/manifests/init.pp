# Class: postfix
#
# This class installs the postfix package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the haveged package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'postfix':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'postfix':
#      ensure => 'absent'
#    }
#
class postfix (
  $ensure = $::postfix::params::postfix_package_ensure
) inherits ::postfix::params {
  package { $::postfix::params::postfix_package:
    ensure  => $ensure,
  }

  $postfix_aliases = hiera('postfix::aliases',{})
  create_resources('postfix::aliases',$postfix_aliases)

  $postfix_config = hiera('postfix',{})
  create_resources('postfix::config',$postfix_config)

  $postfix_generic = hiera('postfix::generic',{})
  create_resources('postfix::generic',$postfix_generic)

  service { $::postfix::params::postfix_service:
    ensure  => running,
    enable  => true,
    require => Package[$::postfix::params::postfix_package],
  }

  service { 'sendmail':
    ensure  => stopped,
    enable  => false,
    require => Package[$::postfix::params::postfix_package],
  }

}
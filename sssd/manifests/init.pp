# Class: sssd
#
# This class installs the sssd package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the sssd package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'sssd':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'sssd':
#      ensure => 'absent'
#    }
#
class sssd (
  $ensure = $::sssd::params::sssd_package_ensure
) inherits ::sssd::params {
  package { $::sssd::params::sssd_package:
    ensure  => $ensure
  }

  $sssd_config = hiera('sssd',{})
  create_resources('sssd::config',$sssd_config)

  service { $::sssd::params::sssd_service:
    ensure  => running,
    enable  => true,
    require => Package[$::sssd::params::sssd_package],
  }
}
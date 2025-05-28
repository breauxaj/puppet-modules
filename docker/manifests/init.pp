# Class: docker
#
# This class installs Docker
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the docker package
#
# Actions:
#   - Install Docker
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'docker':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'docker':
#      ensure => 'absent'
#    }
#
class docker (
  $ensure = 'latest'
) inherits ::docker::params {
  package { $::docker::params::docker_package:
    ensure  => $ensure,
    require => Group['docker']
  }

  service { $::docker::params::docker_service:
    ensure  => running,
    enable  => true,
    require => [
      Group['docker'],
      Package[$::docker::params::docker_package]
    ]
  }

}

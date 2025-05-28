# Class: ssh
#
# This class installs ssh
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install ssh
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'ssh': }
#
class ssh (
  $ensure = $::ssh::params::ssh_package_ensure
) inherits ::ssh::params {
  package { $::ssh::params::ssh_packages:
    ensure  => $ensure,
  }

  $ssh_config = hiera_hash('ssh::config',{})
  create_resources('ssh::config',$ssh_config)

  service { $::ssh::params::ssh_service:
    ensure  => running,
    enable  => true,
    require => Package[$::ssh::params::ssh_packages],
  }

}

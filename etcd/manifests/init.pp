# Class: etcd
#
# This class installs etcd
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install etcd
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'etcd': }
#
class etcd (
  $ensure = $::etcd::params::etcd_package_ensure
) inherits ::etcd::params {
  package { $::etcd::params::etcd_package:
    ensure  => $ensure,
  }

  $config = hiera('etcd',{})
  create_resources('etcd::config',$config)

  service { $::etcd::params::etcd_service:
    ensure  => running,
    enable  => true,
    require => Package[$::etcd::params::etcd_package],
  }

}

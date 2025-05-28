# Class: nginx
#
# This class installs nginx
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install nginx
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nginx': }
#
class nginx (
  $ensure = $::nginx::params::nginx_package_ensure
) inherits ::nginx::params {
  package { $::nginx::params::nginx_package:
    ensure => $ensure,
  }

  service { $::nginx::params::nginx_service:
    ensure  => running,
    enable  => true,
    require => Package[$::nginx::params::nginx_package]
  }

}
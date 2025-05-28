# Class: cachefs
#
# This class installs CacheFS
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install CacheFS
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'cachefs': }
#
class cachefs (
  $ensure = 'latest'
) inherits ::cachefs::params {
  package { $::cachefs::params::cachefs_package:
    ensure  => $ensure,
  }

  service { $::cachefs::params::cachefs_service:
    ensure  => running,
    enable  => true,
    require => Package[$::cachefs::params::cachefs_package],
  }

}
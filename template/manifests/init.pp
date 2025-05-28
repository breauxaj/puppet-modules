# Class: template
#
# This class installs template
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install template
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'template': }
#
class template (
  $ensure = $::template::params::template_package_ensure
) inherits ::template::params {
  package { $::template::params::template_package:
    ensure => $ensure,
  }

  service { $::template::params::template_service:
    ensure  => running,
    enable  => true,
    require => Package[$::template::params::template_package]
  }

}
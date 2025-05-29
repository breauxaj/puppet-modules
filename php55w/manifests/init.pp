# Class: php55w
#
# This class installs PHP 5.5
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to install
#
# Actions:
#   - Install PHP 5.5
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'php55w': }
#
class php55w (
  $ensure = 'latest'
) inherits ::php55w::params {
  package { $::php55w::params::php55w_packages:
    ensure  => $ensure,
    require => Yumrepo['webtatic']
  }
  
}
# Class: php56w
#
# This class installs PHP 5.6
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to install
#
# Actions:
#   - Install PHP 5.6
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'php56w': }
#
class php56w (
  $ensure = 'latest'
) inherits ::php56w::params {
  package { $::php56w::params::php56w_packages:
    ensure  => $ensure,
    require => Yumrepo['webtatic']
  }
  
}
# Class: php56
#
# This class installs PHP 5.6 for Amazon AMI
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
#    class { 'php56': }
#
class php56 (
  $ensure = $::php56::params::php_package_ensure
) inherits ::php56::params {
  package { $::php56::params::php_packages:
    ensure  => $ensure
  }

  $config = hiera_hash('php',{})
  create_resources('php56::config',$config)

  $modules = hiera_hash('php::modules',{})
  create_resources('php56::modules',$modules)

  $raw = hiera_hash('php::raw',{})
  create_resources('php56::raw',$raw)

  exec { 'php-apachectl-restart':
    command     => '/usr/sbin/apachectl restart',
    onlyif      => '/usr/bin/test -x /usr/sbin/apachectl',
    refreshonly => true
  }

}

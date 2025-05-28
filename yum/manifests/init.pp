# Class: yum
#
# This class manages yum
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Manages yum repositories
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'yum': }
#
class yum (
  $ensure = $::yum::params::yum_package_ensure
) inherits ::yum::params {
  case $::osfamily {
    'RedHat': {
      package { $::yum::params::yum_packages:
        ensure  => $ensure,
      }

      $config = hiera_hash('yum::config',{})
      create_resources('yum::config',$config)

      $gpgkeys = hiera_hash('yum::gpgkeys',{})
      create_resources('yum::gpgkey',$gpgkeys)

      $packages = hiera_hash('yum::packages',{})
      create_resources('yum::packages',$packages)

      $repos = hiera_hash('yum::repos',{})
      create_resources('yumrepo',$repos)

      service { $::yum::params::yum_service:
        ensure  => running,
        enable  => true,
        require => Package[$::yum::params::yum_packages],
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

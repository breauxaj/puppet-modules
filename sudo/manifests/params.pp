# Class: sudo::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class sudo::params {
  $sudo_package_ensure = 'latest'

  case $::osfamily {
    'Debian', 'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $sudo_package = 'sudo'

              file { '/etc/sudoers.d':
                ensure  => directory,
                owner   => 'root',
                group   => 'root',
                mode    => '0750',
                recurse => true,
                force   => true,
                purge   => true,
              }
            }
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

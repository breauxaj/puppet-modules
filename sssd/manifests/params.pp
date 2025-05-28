# Class: sssd::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class sssd::params {
  $sssd_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {

            }
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        'Amazon': {
          case $::operatingsystemmajrelease {
            default: {

            }
          }
        }
        default: {
          case $::operatingsystemmajrelease {
            default: {

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

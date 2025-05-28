# Class: haveged::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class haveged::params {
  $haveged_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $haveged_package = 'haveged'
              $haveged_service = 'haveged'
            }
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        'Amazon': {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
        }
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $haveged_package = 'haveged'
              $haveged_service = 'haveged'
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

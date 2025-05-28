# Class: mongodb::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class mongodb::params {
  $mongodb_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $mongodb_config  = '/etc/mongodb.conf'
              $mongodb_package = 'mongodb-server'
              $mongodb_service = 'mongodb'
            }
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $mongodb_config  = '/etc/mongod.conf'
              $mongodb_package = 'mongodb-server'
              $mongodb_service = 'mongod'
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

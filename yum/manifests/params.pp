# Class: yum::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class yum::params {
  $yum_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $yum_context  = '/files/etc/yum.conf/main'
              $yum_packages = [
                'yum',
                'yum-cron',
                'yum-utils'
              ]
              $yum_service  = 'yum-cron'
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

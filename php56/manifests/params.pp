# Class: php56::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other operatingsysem patterns - amazon ami only
#
class php56::params {
  $php_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        Amazon: {
          case $::operatingsystemmajrelease {
            default: {
              $php_packages = [
                'php56',
                'php56-bcmath',
                'php56-cli',
                'php56-common',
                'php56-dba',
                'php56-devel',
                'php56-gd',
                'php56-intl',
                'php56-ldap',
                'php56-mbstring',
                'php56-mcrypt',
                'php56-mysqlnd',
                'php56-pdo',
                'php56-process',
                'php56-xml'
              ]
            }
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

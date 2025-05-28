# Class: php56u::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class php56u::params {
  $php_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $php_packages = [
                'php56u',
                'php56u-bcmath',
                'php56u-cli',
                'php56u-common',
                'php56u-dba',
                'php56u-devel',
                'php56u-gd',
                'php56u-intl',
                'php56u-ldap',
                'php56u-mbstring',
                'php56u-mcrypt',
                'php56u-mssql',
                'php56u-mysqlnd',
                'php56u-pdo',
                'php56u-pear',
                'php56u-process',
                'php56u-xml'
              ]
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

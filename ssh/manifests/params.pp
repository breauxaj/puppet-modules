# Class: ssh::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class ssh::params {
  $ssh_package_ensure = 'latest'

  $ssh_context = '/files/etc/ssh/sshd_config'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $ssh_packages = [
                'openssh-server',
                'openssh-client'
              ]

              $ssh_service  = 'ssh'
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
              $ssh_packages = [
                'openssh',
                'openssh-server',
                'openssh-clients'
              ]

              $ssh_service  = 'sshd'
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

# Class: nrpe::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class nrpe::params {
  $nrpe_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $nrpe_confd   = '/etc/nagios/nrpe.d'
              $nrpe_config  = '/etc/nagios/nrpe.cfg'
              $nrpe_context = '/files/etc/nagios/nrpe.cfg'

              $nrpe_package = 'nagios-nrpe-server'
              $nrpe_service = 'nagios-nrpe-server'

              $nrpe_plugins = '/usr/lib/nagios/plugins'

              $nrpe_plugins_packages = [
                'monitoring-plugins-basic',
                'monitoring-plugins-common',
                'nagios-nrpe-plugin',
                'nagios-plugins-basic',
                'nagios-plugins-common',
                'nagios-plugins-standard'
              ]
            }
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        default: {
          $nrpe_confd   = '/etc/nrpe.d'
          $nrpe_config  = '/etc/nagios/nrpe.cfg'
          $nrpe_context = '/files/etc/nagios/nrpe.cfg'

          $nrpe_package = 'nrpe'
          $nrpe_service = 'nrpe'

          $nrpe_plugins = '/usr/lib64/nagios/plugins'

          $nrpe_plugins_packages = [
            'nagios-plugins-all',
            'nagios-plugins-check-updates',
            'nagios-plugins-nrpe'
          ]

          case $::operatingsystemmajrelease {
            '7': {
              file { '/etc/firewalld/services/nrpe.xml':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0640',
                source => 'puppet:///modules/nrpe/nrpe.xml',
              }
            }
            default: { }
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}






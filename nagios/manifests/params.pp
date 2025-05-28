# Class: nagios::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class nagios::params {
  $nagios_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $nagios_cgi      = '/etc/nagios3/cgi.cfg'
              $nagios_confd    = '/etc/nagios3/conf.d'
              $nagios_config   = '/etc/nagios3/nagios.cfg'
              $nagios_passwd   = '/etc/nagios3/passwd'
              $nagios_package  = 'nagios3'
              $nagios_service = 'nagios3'

              Nagios_command {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_command.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_contact {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_contact.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_contactgroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_contactgroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_host {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_host.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostdependency {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostdependency.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostescalation {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostescalation.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostextinfo {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostextinfo.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostgroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostgroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_service {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_service.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_servicedependency {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_servicedependency.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_serviceescalation {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_serviceescalation.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_serviceextinfo {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_serviceextinfo.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_servicegroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_servicegroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_timeperiod {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_timeperiod.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }
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
              $nagios_cgi      = '/etc/nagios/cgi.cfg'
              $nagios_confd    = '/etc/nagios/conf.d'
              $nagios_config   = '/etc/nagios/nagios.cfg'
              $nagios_passwd   = '/etc/nagios/passwd'
              $nagios_package  = 'nagios'
              $nagios_service  = 'nagios'

              Nagios_command {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_command.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_contact {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_contact.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_contactgroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_contactgroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_host {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_host.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostdependency {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostdependency.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostescalation {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostescalation.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostextinfo {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostextinfo.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_hostgroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_hostgroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_service {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_service.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_servicedependency {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_servicedependency.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_serviceescalation {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_serviceescalation.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_serviceextinfo {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_serviceextinfo.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_servicegroup {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_servicegroup.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
              }

              Nagios_timeperiod {
                owner   => 'root',
                group   => 'nagios',
                mode    => '0640',
                target  => "${nagios_confd}/nagios_timeperiod.cfg",
                notify  => Service[$nagios_service],
                require => Package[$nagios_package],
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

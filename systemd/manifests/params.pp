# Class: systemd::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class systemd::params {
  $systemd_package_ensure = 'latest'

  case $::operatingsystem {
    'CentOS', 'Debian', 'OracleLinux', 'RedHat': {
      $systemd_package       = 'systemd'
      $systemd_override_path = '/etc/systemd/system'
      $systemd_unit_path     = '/usr/lib/systemd/system'

      exec { 'systemctl-daemon-reload':
        command     => '/usr/bin/systemctl daemon-reload',
        refreshonly => true
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
    }
  }

}

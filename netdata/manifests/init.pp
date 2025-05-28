# Class: netdata
#
# This class installs Netdata
#
# Parameters:
#
#  source:
#    Git repository location
#
# Actions:
#   - Install Netdata
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'netdata': }
#
class netdata (
  $source = $::netdata::params::netdata_source
) inherits ::netdata::params {
  case $::osfamily {
    'RedHat': {
      exec { 'clone-netdata':
        path    => '/bin:/usr/bin',
        command => "git clone ${source}",
        cwd     => '/usr/src',
        creates => '/usr/src/netdata',
        timeout => 10000,
        onlyif  => 'test ! -f /usr/src/netdata/netdata-installer.sh',
      }

      exec { 'install-netdata-deps':
        command => template('netdata/dependencies.erb'),
        timeout => 10000,
        creates => '/etc/netdata.dependencies'
      }

      exec { 'install-netdata':
        path    => '/bin:/usr/bin:/usr/src/netdata',
        command => 'netdata-installer.sh --dont-wait',
        cwd     => '/usr/src/netdata',
        creates => '/usr/sbin/netdata',
        timeout => 10000,
        require => Exec[
          'clone-netdata',
          'install-netdata-deps'
        ],
      }

      service { $::netdata::params::netdata_service:
        ensure  => running,
        enable  => true,
        require => Exec['install-netdata']
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

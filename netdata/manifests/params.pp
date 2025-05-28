# Class: netdata::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class netdata::params {
  case $::osfamily {
    'RedHat': {
      $netdata_service = 'netdata'
      $netdata_source  = 'https://github.com/firehol/netdata.git'

      file { '/etc/firewalld/services/netdata.xml':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0640',
        source => 'puppet:///modules/netdata/netdata.xml',
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

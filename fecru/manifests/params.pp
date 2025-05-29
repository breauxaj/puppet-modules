# Class: fecru::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#   - Does not support older redhat releases - 7 only
#
class fecru::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          $fecru_root    = '/usr/local/fecru'

          $fecru_service = 'fecru'

          group { 'fecru':
            ensure => present,
            gid    => 8060,
          }

          user { 'fecru':
            ensure     => present,
            gid        => 8060,
            home       => '/var/lib/fecru',
            shell      => '/sbin/nologin',
            managehome => true,
            uid        => 8060,
          }

          file { '/etc/sysconfig/fecru':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
          }

        }
        default: { }
      }

    }
    default: { }
  }

}

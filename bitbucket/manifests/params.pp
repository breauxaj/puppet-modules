# Class: bitbucket::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#   - Does not support older redhat releases - 7 only
#
class bitbucket::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          $bitbucket_root    = '/usr/local/bitbucket'

          $bitbucket_service = 'bitbucket'

          group { 'bitbucket':
            ensure => present,
            gid    => 7990,
          }

          user { 'bitbucket':
            ensure     => present,
            gid        => 7990,
            home       => '/var/lib/bitbucket',
            shell      => '/sbin/nologin',
            managehome => true,
            uid        => 7990,
          }

          file { '/etc/sysconfig/bitbucket':
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

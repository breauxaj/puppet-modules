# Class: solr::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#   - Does not support older redhat releases - 7 only
#
class solr::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          $solr_root    = '/usr/local/solr'

          $solr_service = 'solr'

          group { 'solr':
            ensure => present,
            gid    => 8983,
          }

          user { 'solr':
            ensure     => present,
            gid        => 8983,
            home       => '/var/lib/solr',
            shell      => '/sbin/nologin',
            managehome => true,
            uid        => 8983,
          }

          file { '/etc/sysconfig/solr':
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

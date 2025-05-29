# Class: mariadb10::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class mariadb10::params {
  case $::osfamily {
    'redhat': {
      $dist = $::operatingsystem ? {
        /(?i-mx:centos)/ => 'centos',
        /(?i-mx:redhat)/ => 'rhel',
      }
    
      $hm = $::hardwaremodel ? {
        /(?i-mx:i686)/   => 'x86',
        /(?i-mx:x86_64)/ => 'amd64',
      }
      
      $mariadb_conflicts      = 'mysql'
    
      $mariadb_version        = '10.1'
    
      $mariadb_package        = 'MariaDB-client'
      $mariadb_server_package = 'MariaDB-server'
      
      $mariadb_tuner_script   = '/usr/local/sbin/mysqltuner.pl'
      
      yumrepo { 'mariadb':
        baseurl        => "http://yum.mariadb.org/${mariadb_version}/${dist}${::lsbmajdistrelease}-${hm}",
        failovermethod => 'priority',
        enabled        => '1',
        gpgcheck       => '1',
        gpgkey         => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
        descr          => 'MariaDB',
      }

      case $::lsbmajdistrelease {
        '7': {
          $mariadb_service = 'mariadb'
        }
        default: {
          $mariadb_service = 'mysql'
        }
      }

    }
    default: { }
  }

}

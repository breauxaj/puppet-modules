# Class: docker::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#   - Does not support older redhat releases - 7 only
#
class docker::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          $docker_package       = 'docker-engine'

          $docker_service       = 'docker'

          group { 'docker':
            ensure => present,
            gid    => 2375,
          }

          yumrepo { 'docker':
            baseurl        => "https://yum.dockerproject.org/repo/main/centos/${::lsbmajdistrelease}",
            failovermethod => 'priority',
            enabled        => '1',
            gpgcheck       => '1',
            gpgkey         => 'https://yum.dockerproject.org/gpg',
            descr          => 'Docker Repository',
          }

        }
        default: { }
      }
    }
    default: { }
  }

}

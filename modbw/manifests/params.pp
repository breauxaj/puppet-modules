# Class: modbw::params
#
# This class set parameters used in this module
#
# Actions:
#   - Filters rhel7 usage - not supported
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modbw::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          fail("${::osfamily} v${::lsbmajdistrelease} is not supported.")
        }
        default: {
          $modbw_conf    = '/etc/httpd/conf.d/mod_bw.conf'
          $modbw_package = 'mod_bw'
        }
      }
    }
    default: { }
  }

}

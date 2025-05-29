# Class: modauthxradius::params
#
# This class set parameters used in this module
#
# Actions:
#   - Filters rhel7 usage - not supported
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modauthxradius::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          fail("${::osfamily} v${::lsbmajdistrelease} is not supported.")
        }
        default: {
          $modauthxradius_conf    = '/etc/httpd/conf.d/mod_auth_xradius.conf'
          $modauthxradius_package = 'mod_auth_xradius'
        }
      }
    }
    default: { }
  }

}

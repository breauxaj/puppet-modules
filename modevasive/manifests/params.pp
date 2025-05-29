# Class: modevasive::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modevasive::params {
  case $::osfamily {
    'redhat': {
      $modevasive_conf    = '/etc/httpd/conf.d/mod_evasive.conf'
      $modevasive_package = 'mod_evasive'
    }
    default: { }
  }

}

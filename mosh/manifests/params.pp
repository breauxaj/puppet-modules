# Class: mosh::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class mosh::params {
  case $::osfamily {
    'redhat': {
      $mosh_package = 'mosh'
    }
    default: { }
  }

}

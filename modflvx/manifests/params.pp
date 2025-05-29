# Class: modflvx::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modflvx::params {
  case $::osfamily {
    'redhat': {
      $modflvx_conf    = '/etc/httpd/conf.d/flvx.conf'
      $modflvx_package = 'mod_flvx'
    }
    default: { }
  }

}

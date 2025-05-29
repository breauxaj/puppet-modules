# Class: modsecurity::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modsecurity::params {
  case $::osfamily {
    'redhat': {
      $modsecurity_conf        = '/etc/httpd/conf.d/mod_security.conf'
      $modsecurity_package     = 'mod_security'
      
      $modsecurity_crs_package = 'mod_security_crs'
    }
    default: { }
  }

}

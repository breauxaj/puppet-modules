# Class: modssl::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modssl::params {
  case $::osfamily {
    'redhat': {
      $modssl_conf    = '/etc/httpd/conf.d/ssl.conf'
      $modssl_package = 'mod_ssl'
    }
    default: { }
  }

}

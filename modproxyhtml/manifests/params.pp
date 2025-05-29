# Class: modproxyhtml::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modproxyhtml::params {
  case $::osfamily {
    'redhat': {
      $modproxyhtml_conf    = '/etc/httpd/conf.d/proxy_html.conf'
      $modproxyhtml_package = 'mod_proxy_html'
    }
    default: { }
  }

}

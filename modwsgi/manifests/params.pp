# Class: modwsgi::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modwsgi::params {
  case $::osfamily {
    'redhat': {
      $modwsgi_conf    = '/etc/httpd/conf.d/wsgi.conf'
      $modwsgi_package = 'mod_wsgi'
    }
    default: { }
  }

}

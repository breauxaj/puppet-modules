# Class: modperl::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modperl::params {
  case $::osfamily {
    'redhat': {
      $modperl_conf    = '/etc/httpd/conf.d/perl.conf'
      $modperl_package = 'mod_perl'
    }
    default: { }
  }

}

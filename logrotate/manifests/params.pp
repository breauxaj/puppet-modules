# Class: logrotate::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class logrotate::params {
  case $::osfamily {
    'redhat': {
      $logrotate_conf    = '/etc/logrotate.conf'
      $logrotate_path    = '/etc/logrotate.d'

      $logrotate_btmp    = '/etc/logrotate.d/btmp'
      $logrotate_wtmp    = '/etc/logrotate.d/wtmp'

      $logrotate_package = 'logrotate'

    }
    default: { }
  }

}

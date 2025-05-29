# Class: rsyslog::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class rsyslog::params {
  case $::osfamily {
    'redhat': {
      $rsyslog_confd   = '/etc/rsyslog.d'
      
      $rsyslog_service = 'rsyslog'

      $rsyslog_package = 'rsyslog'

    }
    default: { }
  }

}

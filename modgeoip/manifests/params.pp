# Class: modgeoip::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class modgeoip::params {
  case $::osfamily {
    'redhat': {
      $modgeoip_conf     = '/etc/httpd/conf.d/mod_geoip.conf'
      $modgeoip_packages = [
        'mod_geoip',
        'GeoIP'
      ]
    }
    default: { }
  }

}

# Class: cachefs::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class cachefs::params {
  case $::osfamily {
    'redhat': {
      $cachefs_package = 'cachefilesd'

      $cachefs_conf    = '/etc/cachefilesd.conf'

      $cachefs_dir     = '/var/cache/fscache'
      $cachefs_tag     = $::hostname
      $cachefs_brun    = '10%'
      $cachefs_bcull   = '7%'
      $cachefs_bstop   = '3%'
      $cachefs_frun    = '10%'
      $cachefs_fcull   = '7%'
      $cachefs_fstop   = '3%'

      $cachefs_service = 'cachefilesd'
    }
    default: { }
  }

}

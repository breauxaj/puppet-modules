# Class: drush::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class drush::params {
  $drush_url = 'https://codeload.github.com/drush-ops/drush/tar.gz'

  $drush_6 = "${drush_url}/6.7.0"
  $drush_7 = "${drush_url}/7.1.0"
  $drush_8 = "${drush_url}/8.0.1"

}

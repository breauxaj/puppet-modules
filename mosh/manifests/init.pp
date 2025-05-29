# Class: mosh
#
# This class installs mosh
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install mosh
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'mosh': }
#
class mosh (
  $ensure = 'latest'
) inherits ::mosh::params {
  package { $::mosh::params::mosh_package:
    ensure  => $ensure,
  }

}

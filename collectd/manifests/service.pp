# Define: collectd::service
#
# This define manages the Collectd service
#
# Parameters:
#
#  ensure:
#    Controls the state of the service
#
#  enable:
#    Controls the service start on boot
#
# Actions:
#   - Stops/starts the Collectd service
#
# Requires:
#
#  EPEL repository
#
# Sample Usage:
#
#  To enable the service, use:
#
#    collectd::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define collectd::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'collectd',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}

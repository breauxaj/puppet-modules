# Define: lighttpd::service
#
# This define manages the lighttpd service
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
#   - Stops/starts the lighttpd service
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    lighttpd::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define lighttpd::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'lighttpd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

# Define: haproxy::service
#
# This define manages the HAProxy service
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
#   - Stops/starts the HAProxy service
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    haproxy::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define haproxy::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'haproxy',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

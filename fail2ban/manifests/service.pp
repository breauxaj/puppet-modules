# Define: fail2ban::service
#
# This define manages the Fail2ban service
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
#   - Stops/starts the Fail2ban service
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    fail2ban::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define fail2ban::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'fail2ban',
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'fail2ban',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => Package[$depends],
  }

}

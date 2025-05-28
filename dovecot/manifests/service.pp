# Define: dovecot::service
#
# This define manages the Dovecot service
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
#   - Stops/starts the Dovecot service
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    dovecot::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define dovecot::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dovecot',
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dovecot',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => Package[$depends],
  }

}

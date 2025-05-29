# Define: mailcatcher::service
#
# This define manages the Mailcatcher service
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
#   - Stops/starts the Mailcatcher service
#   - Stages the init script for use
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    mailcatcher::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define mailcather::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mailcatcher',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => File['/etc/init.d/mailcatcher'],
  }

  file { '/etc/init.d/mailcatcher':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/mailcatcher/mailcatcher.init'
  }

}

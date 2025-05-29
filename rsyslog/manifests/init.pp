# Class: rsyslog
#
# This class installs rsyslog
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install rsyslog
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'rsyslog': }
#
class rsyslog (
  $ensure = 'latest'
) inherits ::rsyslog::params {
  package { $::rsyslog::params::rsyslog_package:
    ensure  => $ensure,
  }

  file { $::rsyslog::params::rsyslog_confd:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
    force   => true,
    require => Package[$::rsyslog::params::rsyslog_package],
  }

  service { $::rsyslog::params::rsyslog_service:
    ensure  => running,
    enable  => true,
    require => Package[$::rsyslog::params::rsyslog_package],
  }

}

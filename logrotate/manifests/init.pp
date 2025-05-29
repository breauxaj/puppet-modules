# Class: logrotate
#
# This class installs logrotate
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to download
#
# Actions:
#   - Install logrotate
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'logrotate': }
#
class logrotate (
  $ensure = 'latest'
) inherits ::logrotate::params {
  package { $::logrotate::params::logrotate_package:
    ensure  => $ensure,
  }

  file { $::logrotate::params::logrotate_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/logrotate/logrotate.txt',
    require => Package[$::logrotate::params::logrotate_package],  
  }

  file { $::logrotate::params::logrotate_path:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package[$::logrotate::params::logrotate_package],
  }

  file { $::logrotate::params::logrotate_btmp:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/logrotate/btmp.txt',
    require => File[$::logrotate::params::logrotate_path],  
  }

  file { $::logrotate::params::logrotate_wtmp:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/logrotate/wtmp.txt',
    require => File[$::logrotate::params::logrotate_path],  
  }

}

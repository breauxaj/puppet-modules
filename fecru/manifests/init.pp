# Class: fecru
#
# This class manages Fisheye and Crucible
#
# Parameters:
#
# Actions:
#   - Manages Fisheye and Crucible
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'fecru': }
#
class fecru (
  $fecru_root = $::fecru::params::fecru_root,
) inherits ::fecru::params {
  file { '/usr/lib/systemd/system/fecru.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('fecru/fecru.erb')
  } ~> Exec['fecru_reload']

  file { '/etc/systemd/system/fecru.service':
    ensure => 'link',
    owner  => 'root',
    group  => 'root',
    target => '/usr/lib/systemd/system/fecru.service'
  }

  exec { 'fecru_reload':
    command     => '/usr/bin/systemctl daemon-reload',
    refreshonly => true,
    notify      => Service[$::fecru::params::fecru_service]
  }

  service { $::fecru::params::fecru_service:
    ensure  => running,
    enable  => true,
    require => File['/etc/systemd/system/fecru.service'],
  }

}

# Class: bitbucket
#
# This class manages Atlassian Bitbucket
#
# Parameters:
#
# Actions:
#   - Manages Atlassian Bitbucket
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'bitbucket': }
#
class bitbucket (
  $bitbucket_root = $::bitbucket::params::bitbucket_root,
) inherits ::bitbucket::params {
  file { '/usr/lib/systemd/system/bitbucket.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('bitbucket/bitbucket.erb')
  } ~> Exec['bitbucket_reload']

  file { '/etc/systemd/system/bitbucket.service':
    ensure => 'link',
    owner  => 'root',
    group  => 'root',
    target => '/usr/lib/systemd/system/bitbucket.service'
  }

  exec { 'bitbucket_reload':
    command => '/usr/bin/systemctl daemon-reload',
    notify  => Service[$::bitbucket::params::bitbucket_service]
  }

  service { $::bitbucket::params::bitbucket_service:
    ensure  => running,
    enable  => true,
    require => File['/etc/systemd/system/bitbucket.service'],
  }

}

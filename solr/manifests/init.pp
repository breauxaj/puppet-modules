# Class: solr
#
# This class manages Apache Solr
#
# Parameters:
#
# Actions:
#   - Manages Apache Solr
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'solr': }
#
class solr (
  $solr_root = $::solr::params::solr_root
) inherits ::solr::params {
  file { '/usr/lib/systemd/system/solr.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('solr/solr.erb')
  } ~> Exec['solr_reload']

  file { '/etc/systemd/system/solr.service':
    ensure => 'link',
    owner  => 'root',
    group  => 'root',
    target => '/usr/lib/systemd/system/solr.service'
  }

  exec { 'solr_reload':
    command => '/usr/bin/systemctl daemon-reload',
    notify  => Service[$::solr::params::solr_service]
  }

  service { $::solr::params::solr_service:
    ensure  => running,
    enable  => true,
    require => File['/etc/systemd/system/solr.service'],
  }

}

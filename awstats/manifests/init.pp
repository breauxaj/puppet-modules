# Class: awstats
#
# This class installs AWStats
#
# Parameters:
#
#  version: (default 7.4)
#    Determine which version to download
#
#  source: 
#    URL to download from official mirror
#
# Actions:
#   - Install AWStats
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'awstats': }
#
class awstats (
  $version = '7.4',
  $source = 'http://prdownloads.sourceforge.net/awstats'
){
  exec { 'get-awstats':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/awstats-${version}.tar.gz",
    cwd     => '/tmp',
    creates => "/tmp/awstats-${version}.tar.gz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/awstats-${version}",
  }

  exec { 'untar-awstats':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/awstats-${version}.tar.gz",
    cwd     => '/usr/local',
    creates => "/usr/local/awstats-${version}",
    timeout => 10000,
    require => Exec['get-awstats'],
  }

  file { "/usr/local/awstats-${version}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    recurse => true,
    require => Exec['untar-awstats'],
  }

  file { '/usr/local/awstats':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/awstats-${version}",
    require => Exec['untar-awstats'],
  }

}

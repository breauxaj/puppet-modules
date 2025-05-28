# Class: ant
#
# This class installs Apache Ant
#
# Parameters:
#
#  version: (default 1.9.6)
#    Determine which version to download
#
#  source: 
#    URL to download from official mirror
#
# Actions:
#   - Install Apache Ant
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'ant': }
#
class ant (
  $version = '1.9.6',
  $source = 'http://www.us.apache.org/dist/ant/binaries'
){
  exec { 'get-ant':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/apache-ant-${version}-bin.tar.gz",
    cwd     => '/tmp',
    creates => "/tmp/apache-ant-${version}-bin.tar.gz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/apache-ant-${version}",
  }

  exec { 'untar-ant':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/apache-ant-${version}-bin.tar.gz",
    cwd     => '/usr/local',
    creates => "/usr/local/apache-ant-${version}",
    timeout => 10000,
    require => Exec['get-ant'],
  }

  file { "/usr/local/apache-ant-${version}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    recurse => true,
    require => Exec['untar-ant'],
  }

  file { '/usr/local/ant':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/apache-ant-${version}",
    require => Exec['untar-ant'],
  }

  file { '/etc/profile.d/ant.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ant/profile.txt',
  }

  package { 'ant': ensure => absent }

}
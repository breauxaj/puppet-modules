class kafka (
  $version = '0.8.1',
  $source = 'http://www.us.apache.org/dist/kafka/'
){
  exec { 'get-server':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/${version}/kafka_2.9.2-${version}.tgz",
    cwd     => '/tmp',
    creates => "/tmp/kafka_2.9.2-${version}.tgz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/kafka_2.9.2-${version}",
  }

  exec { 'untar-server':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/kafka_2.9.2-${version}.tgz",
    cwd     => '/usr/local',
    creates => "/usr/local/kafka_2.9.2-${version}",
    timeout => 10000,
    require => Exec['get-server'],
  }

  file { '/usr/local/kafka':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/kafka_2.9.2-${version}",
    require => Exec['untar-server'],
  }

  file { '/etc/init.d/kafka':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/kafka/kafka.init'
  }

}

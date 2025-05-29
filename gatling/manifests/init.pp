class gatling (
  $version = '2.1.7',
  $source = 'https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle'
){
  exec { 'get-gatling':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/${version}/gatling-charts-highcharts-bundle-${version}-bundle.zip",
    cwd     => '/tmp',
    creates => "/tmp/gatling-charts-highcharts-bundle-${version}-bundle.zip",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/gatling-charts-highcharts-bundle-${version}",
  }

  exec { 'unzip-gatling':
    path    => '/bin:/usr/bin',
    command => "unzip -q /tmp/gatling-charts-highcharts-bundle-${version}-bundle.zip",
    cwd     => '/usr/local',
    creates => "/usr/local/gatling-charts-highcharts-bundle-${version}",
    timeout => 10000,
    require => Exec['get-gatling'],
  }

  file { "/usr/local/gatling-charts-highcharts-bundle-${version}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    recurse => true,
    require => Exec['unzip-gatling'],
  }

  file { '/usr/local/gatling':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/gatling-charts-highcharts-bundle-${version}",
    require => Exec['unzip-gatling'],
  }

  file { '/etc/profile.d/gatling.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gatling/profile.txt',
  }

}

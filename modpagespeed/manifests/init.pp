class pagespeed (
  $source = 'https://dl-ssl.google.com/dl/linux/direct',
  $version = 'stable'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => "mod-pagespeed-${version}_current_${::hardwaremodel}.rpm",
  }

  package { 'pagespeed':
    ensure   => installed,
    provider => rpm,
    source   => "${source}/${required}",
    require  => Package['httpd'],
  }

  # protect this file from purge
  file { '/etc/httpd/conf.d/pagespeed_libraries.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }

}

class apache::mod::geoip {
  include apache

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'mod_geoip',
      'GeoIP'
    ]
  }

  package { $required:
    ensure  => latest,
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/geoip.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/mod/geoip.erb'),
  }

}

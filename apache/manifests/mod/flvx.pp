class apache::mod::flvx {
  include apache

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mod_flvx',
  }

  package { $required:
    ensure  => latest,
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/flvx.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/mod/flvx.erb'),
  }

}

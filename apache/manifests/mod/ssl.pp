class apache::mod::ssl {
  include apache

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mod_ssl',
  }

  package { $required:
    ensure  => latest,
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/ssl.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/mod/ssl.erb'),
  }

}

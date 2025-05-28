class apache::mod::radius {
  include apache

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mod_auth_xradius',
  }

  package { $required:
    ensure  => latest,
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/radius.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/mod/radius.erb'),
  }

}

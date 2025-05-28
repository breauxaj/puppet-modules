class apache::mod::perl {
  include apache

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mod_perl',
  }

  package { $required:
    ensure  => latest,
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/perl.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/mod/perl.erb'),
  }

}

define apache::alias (
  $aliases = '',
  $aliasmatches = '',
) {
  file { '/etc/httpd/conf.d/alias.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/alias.erb'),
  }

}
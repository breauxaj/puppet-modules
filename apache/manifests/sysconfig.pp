define apache::sysconfig (
  $model = 'prefork',
  $options = '',
  $lang = '',
  $pidfile = ''
) {
  file { '/etc/sysconfig/httpd':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/sysconfig.erb'),
  }

}

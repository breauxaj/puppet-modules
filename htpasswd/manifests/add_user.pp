define htpasswd::add_user (
  $password,
  $filename,
  $encryption = 'md5'
) {
  $cmd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'htpasswd',
  }

  file { $filename:
    ensure => present,
  }

  case $encryption {
    'md5':   { $enc = '-bm' }
    'crypt': { $enc = '-bd' }
    'plain': { $enc = '-bp' }
    'sha':   { $enc = '-bs' }
    default: { $enc = '-bm' }
  }

  exec { "add_user_${name}":
    path    => '/usr/bin',
    command => "${cmd} ${enc} ${filename} ${name} ${password}",
    require => File[$filename],
  }

}

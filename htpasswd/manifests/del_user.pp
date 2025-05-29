define htpasswd::del_user (
  $filename
) {
  $cmd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'htpasswd',
  }

  file { $filename:
    ensure => present,
  }

  exec { "delete_user_${name}":
    path    => '/usr/bin',
    command => "${cmd} -D ${filename} ${name}",
    require => File[$filename],
  }

}

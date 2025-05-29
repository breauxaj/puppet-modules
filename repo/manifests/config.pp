define repo::config (
  $basepath = '',
  $owner = '',
  $group = '',
){
  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      $basepath,
      "${basepath}/i386",
      "${basepath}/i686",
      "${basepath}/noarch",
      "${basepath}/SRPMS",
      "${basepath}/x86_64"
    ],
  }

  file { $paths:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0755',
  }

}

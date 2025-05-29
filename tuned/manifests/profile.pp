define tuned::profile {
  exec { 'tuned-profile':
    path    => '/usr/bin',
    command => "tuned-adm profile ${name}",
  }

}

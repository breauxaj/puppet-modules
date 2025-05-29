class sdlc (
  $label = 'undefined',
) {
  file { '/etc/sdlc':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${label}",
  }

}

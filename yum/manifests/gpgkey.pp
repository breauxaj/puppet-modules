define yum::gpgkey (
  $location,
  $content
) {
  include ::yum

  file { $location:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
  }

}

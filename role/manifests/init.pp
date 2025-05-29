class role (
  $label = 'undefined',
) {
  include role::coldfusion
  include role::drupal
  include role::sql

  hiera_include('role::base', '')

  file { '/etc/role':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${label}",
  }

}

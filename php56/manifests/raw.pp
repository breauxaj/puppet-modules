define php56::raw (
  $ensure = present,
  $content
) {
  include ::php56

  file { "/etc/php.d/${name}.ini":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
    require => Package[$::php56::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}

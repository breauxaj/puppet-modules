define php56::config (
  $value
) {
  include ::php56

  $key = $title

  $context = '/files/etc/php.ini'

  augeas { "php_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::php56::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}

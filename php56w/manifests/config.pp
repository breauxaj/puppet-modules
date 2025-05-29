define php56w::config (
  $value
) {
  include ::php56w

  $key = $title

  $context = '/files/etc/php.ini'

  augeas { "php_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::php56w::params::php56w_packages],
  }

}
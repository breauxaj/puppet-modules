define php55w::config (
  $value
) {
  include ::php55w

  $key = $title

  $context = '/files/etc/php.ini'

  augeas { "php_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::php55w::params::php55w_packages],
  }

}
define phpfpm::config (
  $value
) {
  include ::phpfpm

  $key = $title

  $config = '/etc/php-fpm.conf'

  augeas { "php_fpm_conf/${key}":
    lens    => 'Php.lns',
    incl    => $config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}

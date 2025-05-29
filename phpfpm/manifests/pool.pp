define phpfpm::pool (
  $value
) {
  include ::phpfpm

  $key = $title

  $config = '/etc/php-fpm.d/www.conf'

  augeas { "www_conf/${key}":
    lens    => 'Php.lns',
    incl    => $config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}

define fecru::sysconfig (
  $value
) {
  include ::fecru

  $key = $title

  $context = '/files/etc/sysconfig/fecru'

  augeas { "fecru/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::fecru::params::fecru_service]
  }

}
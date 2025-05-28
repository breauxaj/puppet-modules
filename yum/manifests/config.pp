define yum::config (
  $value
) {
  include ::yum

  $key = $title

  augeas { "yum_conf/${key}":
    context => $::yum::params::yum_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}

define solr::sysconfig (
  $value
) {
  include ::solr

  $key = $title

  $context = '/files/etc/sysconfig/solr'

  augeas { "solr/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::solr::params::solr_service]
  }

}
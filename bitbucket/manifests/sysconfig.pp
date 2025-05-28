define bitbucket::sysconfig (
  $value
) {
  include ::bitbucket

  $key = $title

  $context = '/files/etc/sysconfig/bitbucket'

  augeas { "bitbucket/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::bitbucket::params::bitbucket_service]
  }

}
define php55w::modules (
  $ensure = 'latest'
) {
  include ::php55w

  $required = $title

  package { "php55w-${required}":
    ensure  => $ensure,
    require => Yumrepo['webtatic'],
  }

}

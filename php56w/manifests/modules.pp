define php56w::modules (
  $ensure = 'latest'
) {
  include ::php56w

  $required = $title

  package { "php56w-${required}":
    ensure  => $ensure,
    require => Yumrepo['webtatic'],
  }

}

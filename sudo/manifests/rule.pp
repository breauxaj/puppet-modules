define sudo::rule (
  $ensure,
  $priority,
  $content
) {
  include ::sudo

  file { "/etc/sudoers.d/${priority}-${name}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('sudo/rule.erb'),
  }

}

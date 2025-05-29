define rsyslog::rule (
  $filter,
  $destination
) {
  include ::rsyslog

  file { "${::rsyslog::params::rsyslog_confd}/${name}.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => template('rsyslog/rule.erb'),
    notify  => Service[$::rsyslog::params::rsyslog_service],
  }

}

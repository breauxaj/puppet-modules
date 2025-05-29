class profile::ops::rsyslog {
  include ::rsyslog

  $rsyslog_rule = hiera('rsyslog::rule',{})
  create_resources('rsyslog::rule',$rsyslog_rule)

  $rsyslog_service = hiera('rsyslog::service',{})

  rsyslog::service { 'default':
    ensure => $rsyslog_service['ensure'],
    enable => $rsyslog_service['enable'],
  }

}

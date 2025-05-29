class profile::ops::haveged {
  include ::haveged

  haveged::service { 'default':
    ensure => running,
    enable => true
  }

}

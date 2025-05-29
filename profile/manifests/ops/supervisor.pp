class profile::ops::supervisor {
  include ::supervisor

  $supervisor_hook = hiera('supervisor::hook',{})
  create_resources('supervisor::hook',$supervisor_hook)

  $supervisor_service = hiera('supervisor::service',{})

  supervisor::service { 'default':
    ensure => $supervisor_service['ensure'],
    enable => $supervisor_service['enable'],
  }

}

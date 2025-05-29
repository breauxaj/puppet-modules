class profile::ops::ssh {
  include ::ssh

  $ssh_config = hiera_hash('ssh::config',{})

  ssh::config { 'default':
    allowed_groups => $ssh_config['allowed_groups'],
    allowed_users  => $ssh_config['allowed_users'],
  }

  $ssh_issue = hiera_hash('ssh::issue',{})

  ssh::issue { 'default':
    message => $ssh_issue['message'],
  }

  $ssh_service = hiera_hash('ssh::service',{})

  ssh::service { 'default':
    ensure => $ssh_service['ensure'],
    enable => $ssh_service['true'],
  }

}

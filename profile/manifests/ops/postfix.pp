class profile::ops::postfix {
  include ::postfix

  $postfix_aliases = hiera('postfix::aliases',{})

  postfix::aliases { 'default':
    root_alias => $postfix_aliases['root_alias'],
  }

  $postfix_config = hiera('postfix::config',{})

  postfix::config { 'default':
    relay_host => $postfix_config['relay_host'],
    myorigin   => $postfix_config['myorigin'],
  }

  $postfix_service = hiera('postfix::service',{})

  postfix::service { 'default':
    ensure => $postfix_service['ensure'],
    enable => $postfix_service['enable'],
  }

}

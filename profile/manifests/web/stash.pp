class profile::web::stash {
  hiera_include('profile::web::stash', '')

  $stash_config = hiera('stash::config',{})

  stash::config { 'default':
    runas         => $stash_config['runas'],
    catalina_home => $stash_config['catalina_home'],
  }

  $stash_service = hiera('stash::service',{})

  stash::service { 'default':
    ensure => $stash_service['ensure'],
    enable => $stash_service['enable'],
  }

}

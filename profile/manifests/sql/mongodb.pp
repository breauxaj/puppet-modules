class profile::sql::mongodb {
  include ::mongodb

  $mongodb_config = hiera('mongodb::config',{})

  mongodb::config (
    bind_ip => $mongodb_config['bind_ip'],
    port    => $mongodb_config['port'],
    dbpath  => $mongodb_config['dbpath'],
    auth    => $mongodb_config['auth'],
    verbose => $mongodb_config['verbose'],
  }

  $mongodb_service = hiera('mongodb::service',{})

  mongodb::service { 'default':
    ensure => $mongodb_service['ensure'],
    enable => $mongodb_service['enable'],
  }

}

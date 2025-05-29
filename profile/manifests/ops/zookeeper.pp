class profile::ops::zookeeper {
  include ::zookeeper

  $zookeeper_service = hiera('zookeeper::service',{})

  zookeeper::service { 'default':
    ensure => $zookeeper_service['ensure'],
    enable => $zookeeper_service['enable'],
  }

}

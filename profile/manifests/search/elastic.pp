class profile::search::elastic {  
  include ::elasticsearch

  $elastic_service = hiera('elasticsearch::service',{})

  elasticsearch::service { 'default':
    ensure => $elastic_service['ensure'],
    enable => $elastic_service['enable'],
  }

}
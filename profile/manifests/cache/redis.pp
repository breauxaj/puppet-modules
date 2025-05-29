class profile::cache::redis {  
  include ::redis

  $redis_config = hiera('redis::config',{})
  create_resources('redis::config',$redis_config)

  $redis_service = hiera('redis::service',{})
  create_resources('redis::service',$redis_service)

}

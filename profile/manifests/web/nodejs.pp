class profile::web::nodejs {
  hiera_include('profile::web::nodejs', '')

  $nodejs_instance = hiera('nodejs::instance',{})
  create_resources('nodejs::instance',$nodejs_instance)

  $nodejs_service = hiera('nodejs::service',{})
  create_resources('nodejs::service',$nodejs_service)

}

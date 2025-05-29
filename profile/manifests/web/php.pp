class profile::web::php {
  hiera_include('profile::web::php', '')
  
  $modules = hiera_array('profile::web::php::modules',{})
  php::modules { $modules: }

  $phpredis_config = hiera('phpredis::config',{})
  

}